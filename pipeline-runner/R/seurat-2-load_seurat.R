#' Loads a Seurat object provided by the user
#'
#' This functions is a thin wrapper around `reconstruct_seurat`, which is used to
#' safely read, check, and reconstruct the Seurat object for downstream use.
#'
#'
#' @param input The input params received from the api.
#' @param pipeline_config List with S3 bucket name and SNS topics.
#' @param prev_out 'output' slot from call to \code{download_user_files}
#' @param input_dir A string, where the folder containing the downloaded
#' Seurat object is stored
#'
#' @export
load_seurat <- function(input, pipeline_config, prev_out, input_dir = "/input") {

  config <- prev_out$config
  dataset_dir <- config$samples[1]
  dataset_fpath <- file.path(input_dir, dataset_dir, 'r.rds')

  scdata <- reconstruct_seurat(dataset_fpath)

  prev_out$scdata <- scdata

  res <- list(
    data = list(),
    output = prev_out
  )
  return(res)
}

#' Reconstructs the Seurat object provided by the user
#'
#' The slots needed from the Seurat object are extracted and then their in-built types
#' are strictly checked before creating a new Seurat object. This reconstruction and type
#' checking prevents potentially malicious executable code  (e.g. type `closure` or `environment`)
#' from being stored in the final Seurat object.
#'
#' @param dataset_fpath The path to the r.rds file containing the Seurat object.
#'
#' @return reconstructed SeuratObject
#' @export
reconstruct_seurat <- function(dataset_fpath) {

  # read it
  tryCatch({
    user_scdata <- readRDS(dataset_fpath)
    stopifnot(methods::is(user_scdata, 'Seurat'))
  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_RDS, call. = FALSE)
  })

  # get counts
  tryCatch({
    SeuratObject::DefaultAssay(user_scdata) <- 'RNA'

    # if V5 object, ensure layers are rejoined
    if (methods::is(user_scdata[['RNA']], 'Assay5'))
      user_scdata[['RNA']] <- SeuratObject::JoinLayers(user_scdata[['RNA']])


    counts <- user_scdata[['RNA']]$counts
    test_user_sparse_mat(counts)
    rns <- row.names(counts)
    check_type_is_safe(rns)

  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_COUNTS, call. = FALSE)
  })

  # get meta data
  tryCatch({
    metadata <- user_scdata@meta.data
    metadata$active.ident <- user_scdata@active.ident
    test_user_df(metadata)
  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_METADATA, call. = FALSE)
  })

  # reconstruct Seurat object
  scdata <- SeuratObject::CreateSeuratObject(
    counts,
    meta.data = metadata,
  )

  # add logcounts
  tryCatch({

    layers <- SeuratObject::Layers(user_scdata, assay = 'RNA')
    if ('data' %in% layers) {
      logcounts <- user_scdata[['RNA']]$data
      test_user_sparse_mat(logcounts)
    } else {
      logcounts <- Seurat::NormalizeData(user_scdata[['RNA']]$counts)
    }

    # shouldn't be raw counts
    suspect.counts <- max(logcounts) > 100
    if (suspect.counts) logcounts <- Seurat::NormalizeData(logcounts)

    scdata[['RNA']]$data <- logcounts
  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_LOGCOUNTS, call. = FALSE)
  })


  # add dispersions (need for gene list)
  tryCatch({
    dispersions <- Seurat::FindVariableFeatures(logcounts)
    test_user_df(dispersions)
    colnames(dispersions) <- gsub('^vst[.]', '', colnames(dispersions))

    # keep columns that use: same as `HVFInfo(scdata)`
    dispersions <- dispersions[, c('mean', 'variance', 'variance.standardized')]
    dispersions$SYMBOL <- dispersions$ENSEMBL <- row.names(dispersions)
    scdata@misc$gene_dispersion <- dispersions
  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_HVFINFO, call. = FALSE)
  })

  # add gene annotations
  gene_annotations <- data.frame(
    input = rns,
    name = rns,
    original_name = rns,
    row.names = rns
  )
  scdata@misc$gene_annotations <- gene_annotations


  # add default dimensionality reduction
  # TODO: consider storing resolution, clustering metric, and distance metric
  # for trajectory analysis
  tryCatch({
    names(user_scdata@reductions) <- tolower(names(user_scdata@reductions))
    red_name <- SeuratObject::DefaultDimReduc(user_scdata)
    check_type_is_safe(red_name)
    red_match <- grep("umap|tsne", red_name, value = TRUE)

    if (length(red_match) && !(red_match %in% c("umap", "tsne"))) {
      is_umap <- grepl("umap", red_match)
      new_red_name <- ifelse(is_umap, "umap", "tsne")

      message("Found reduction name ", red_match," containing ", new_red_name)
      user_scdata <- update_reduction_name(user_scdata, red_name, new_red_name)
      red_name <- SeuratObject::DefaultDimReduc(user_scdata)
      message("Updated default reduction: ", red_name)
    }

    stopifnot(red_name %in% c('umap', 'tsne'))

    red <- user_scdata@reductions[[red_name]]
    test_user_df(red@cell.embeddings)
    test_user_df(red@feature.loadings)
    test_user_df(red@feature.loadings.projected)
    red@assay.used <- 'RNA'

    scdata@reductions[[red_name]] <- red
  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_REDUCTION, call. = FALSE)
  })

  # add pca dimensionality reduction (need for trajectory analysis)
  tryCatch({
    pca <- user_scdata@reductions[['pca']]@cell.embeddings
    test_user_df(pca)
    red <- SeuratObject::CreateDimReducObject(
      embeddings = pca,
      assay = 'RNA'
    )
    scdata@reductions[['pca']] <- red
  },
  error = function(e) {
    message(e$message)
    stop(errors$ERROR_SEURAT_REDUCTION, call. = FALSE)
  })

  return(scdata)
}

test_user_df <- function(df) {
  for (col in colnames(df)) {
    check_type_is_safe(df[, col])
  }
}

test_user_sparse_mat <- function(counts) {
  stopifnot(isS4(counts))

  for (slot in methods::slotNames(counts)) {
    check_type_is_safe(methods::slot(counts, slot))
  }
}

check_type_is_safe <- function(x) {

  # typeof determines the R internal type or storage mode of any object
  # whereas methods::is can be tricked by setting class inappropriately (e.g. disguising a function as a numeric)
  safe.types <- c('character', 'double', 'integer', 'logical', 'NULL')

  # recurse into lists until reach node
  if (typeof(x) == 'list') {
    lapply(x, check_type_is_safe)
  } else if (!typeof(x) %in% safe.types) {
    stop('Unexpected data type in uploaded .rds file.')
  }
}


update_reduction_name <- function(scdata, red_name, new_name) {
  current_names <- names(scdata@reductions)
  if (new_name %in% current_names) {
    message("Renaming existing reduction name ", names(scdata@reductions)[current_names == new_name], " to ", paste0(new_name, ".ori"))
    names(scdata@reductions)[current_names == new_name] <- paste0(new_name, ".ori")
  }
  names(scdata@reductions)[current_names == red_name] <- new_name

  return(scdata)
}

