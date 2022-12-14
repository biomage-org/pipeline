# extracted cell cycle gene symbols from Seurat::cc.genes and Seurat::cc.genes.updated.2019
# converted to ensemblIDs using https://biit.cs.ut.ee/gprofiler/convert
# found mice orthologs using https://www.genenames.org/tools/hcop/

human_cc_genes <-
  structure(
    list(
      X = 1:103,
      ensembl_id = c(
        "ENSG00000100297",
        "ENSG00000132646",
        "ENSG00000176890",
        "ENSG00000168496",
        "ENSG00000166508",
        "ENSG00000104738",
        "ENSG00000167325",
        "ENSG00000076248",
        "ENSG00000131153",
        "ENSG00000076003",
        "ENSG00000144354",
        "ENSG00000143476",
        "ENSG00000198056",
        "ENSG00000276043",
        "ENSG00000151725",
        "ENSG00000119969",
        "ENSG00000049541",
        "ENSG00000125630",
        "ENSG00000132780",
        "ENSG00000111247",
        "ENSG00000112312",
        "ENSG00000092470",
        "ENSG00000163950",
        "ENSG00000175305",
        "ENSG00000012963",
        "ENSG00000077514",
        "ENSG00000095002",
        "ENSG00000156802",
        "ENSG00000051180",
        "ENSG00000171848",
        "ENSG00000093009",
        "ENSG00000094804",
        "ENSG00000174371",
        "ENSG00000075131",
        "ENSG00000136982",
        "ENSG00000197299",
        "ENSG00000118412",
        "ENSG00000162607",
        "ENSG00000092853",
        "ENSG00000101868",
        "ENSG00000159259",
        "ENSG00000171421",
        "ENSG00000129173",
        "ENSG00000164104",
        "ENSG00000170312",
        "ENSG00000137804",
        "ENSG00000175063",
        "ENSG00000089685",
        "ENSG00000088325",
        "ENSG00000131747",
        "ENSG00000080986",
        "ENSG00000123975",
        "ENSG00000143228",
        "ENSG00000173207",
        "ENSG00000148773",
        "ENSG00000120802",
        "ENSG00000117724",
        "ENSG00000013810",
        "ENSG00000129195",
        "ENSG00000113810",
        "ENSG00000157456",
        "ENSG00000169607",
        "ENSG00000136108",
        "ENSG00000178999",
        "ENSG00000169679",
        "ENSG00000138160",
        "ENSG00000143401",
        "ENSG00000188229",
        "ENSG00000075218",
        "ENSG00000138182",
        "ENSG00000123485",
        "ENSG00000111665",
        "ENSG00000189159",
        "ENSG00000117399",
        "ENSG00000112742",
        "ENSG00000158402",
        "ENSG00000142945",
        "ENSG00000100401",
        "ENSG00000010292",
        "ENSG00000126787",
        "ENSG00000184661",
        "ENSG00000134690",
        "ENSG00000114346",
        "ENSG00000137807",
        "ENSG00000072571",
        "ENSG00000087586",
        "ENSG00000134222",
        "ENSG00000011426",
        "ENSG00000143815",
        "ENSG00000175216",
        "ENSG00000138778",
        "ENSG00000102974",
        "ENSG00000117650",
        "ENSG00000092140",
        "ENSG00000139354",
        "ENSG00000094916",
        "ENSG00000115163",
        "ENSG00000073111",
        "ENSG00000117748",
        "ENSG00000136492",
        "ENSG00000129195",
        NA,
        NA
      ),
      symbol = c(
        "MCM5",
        "PCNA",
        "TYMS",
        "FEN1",
        "MCM7",
        "MCM4",
        "RRM1",
        "UNG",
        "GINS2",
        "MCM6",
        "CDCA7",
        "DTL",
        "PRIM1",
        "UHRF1",
        "CENPU",
        "HELLS",
        "RFC2",
        "POLR1B",
        "NASP",
        "RAD51AP1",
        "GMNN",
        "WDR76",
        "SLBP",
        "CCNE2",
        "UBR7",
        "POLD3",
        "MSH2",
        "ATAD2",
        "RAD51",
        "RRM2",
        "CDC45",
        "CDC6",
        "EXO1",
        "TIPIN",
        "DSCC1",
        "BLM",
        "CASP8AP2",
        "USP1",
        "CLSPN",
        "POLA1",
        "CHAF1B",
        "MRPL36",
        "E2F8",
        "HMGB2",
        "CDK1",
        "NUSAP1",
        "UBE2C",
        "BIRC5",
        "TPX2",
        "TOP2A",
        "NDC80",
        "CKS2",
        "NUF2",
        "CKS1B",
        "MKI67",
        "TMPO",
        "CENPF",
        "TACC3",
        "PIMREG",
        "SMC4",
        "CCNB2",
        "CKAP2L",
        "CKAP2",
        "AURKB",
        "BUB1",
        "KIF11",
        "ANP32E",
        "TUBB4B",
        "GTSE1",
        "KIF20B",
        "HJURP",
        "CDCA3",
        "JPT1",
        "CDC20",
        "TTK",
        "CDC25C",
        "KIF2C",
        "RANGAP1",
        "NCAPD2",
        "DLGAP5",
        "CDCA2",
        "CDCA8",
        "ECT2",
        "KIF23",
        "HMMR",
        "AURKA",
        "PSRC1",
        "ANLN",
        "LBR",
        "CKAP5",
        "CENPE",
        "CTCF",
        "NEK2",
        "G2E3",
        "GAS2L3",
        "CBX5",
        "CENPA",
        "MCM2",
        "RPA2",
        "BRIP1",
        "FAM64A",
        "MLF1IP",
        "HN1"

      )
    ),
    class = "data.frame",
    row.names = c(NA, -103L)
  )

mouse_cc_genes <-
  structure(
    list(
      X = 1:120,
      ensembl_id = c(
        "ENSMUSG00000005410",
        "ENSMUSG00000027342",
        "ENSMUSG00000067608",
        "ENSMUSG00000025747",
        "ENSMUSG00000024742",
        "ENSMUSG00000029730",
        "ENSMUSG00000022673",
        "ENSMUSG00000030978",
        "ENSMUSG00000029591",
        "ENSMUSG00000031821",
        "ENSMUSG00000026355",
        "ENSMUSG00000055612",
        "ENSMUSG00000037474",
        "ENSMUSG00000025395",
        "ENSMUSG00000001228",
        "ENSMUSG00000024817",
        "ENSMUSG00000031629",
        "ENSMUSG00000025001",
        "ENSMUSG00000023104",
        "ENSMUSG00000027395",
        "ENSMUSG00000028693",
        "ENSMUSG00000030346",
        "ENSMUSG00000006715",
        "ENSMUSG00000027242",
        "ENSMUSG00000004642",
        "ENSMUSG00000028212",
        "ENSMUSG00000041712",
        "ENSMUSG00000030726",
        "ENSMUSG00000024151",
        "ENSMUSG00000022360",
        "ENSMUSG00000052812",
        "ENSMUSG00000027323",
        "ENSMUSG00000020649",
        "ENSMUSG00000022292",
        "ENSMUSG00000000028",
        "ENSMUSG00000017499",
        "ENSMUSG00000039748",
        "ENSMUSG00000032397",
        "ENSMUSG00000022422",
        "ENSMUSG00000030528",
        "ENSMUSG00000028282",
        "ENSMUSG00000028560",
        "ENSMUSG00000042489",
        "ENSMUSG00000006678",
        "ENSMUSG00000022945",
        "ENSMUSG00000021607",
        "ENSMUSG00000046179",
        "ENSMUSG00000054717",
        "ENSMUSG00000019942",
        "ENSMUSG00000027306",
        "ENSMUSG00000001403",
        "ENSMUSG00000069733",
        "ENSMUSG00000017716",
        "ENSMUSG00000027469",
        "ENSMUSG00000020914",
        "ENSMUSG00000017485",
        "ENSMUSG00000024056",
        "ENSMUSG00000062248",
        "ENSMUSG00000026683",
        "ENSMUSG00000028044",
        "ENSMUSG00000062687",
        "ENSMUSG00000031004",
        "ENSMUSG00000019961",
        "ENSMUSG00000026605",
        "ENSMUSG00000037313",
        "ENSMUSG00000020808",
        "ENSMUSG00000034349",
        "ENSMUSG00000032218",
        "ENSMUSG00000048327",
        "ENSMUSG00000037725",
        "ENSMUSG00000020897",
        "ENSMUSG00000070837",
        "ENSMUSG00000027379",
        "ENSMUSG00000012443",
        "ENSMUSG00000015749",
        "ENSMUSG00000030512",
        "ENSMUSG00000036752",
        "ENSMUSG00000058672",
        "ENSMUSG00000045136",
        "ENSMUSG00000062591",
        "ENSMUSG00000001525",
        "ENSMUSG00000016255",
        "ENSMUSG00000062380",
        "ENSMUSG00000001473",
        "ENSMUSG00000022385",
        "ENSMUSG00000024795",
        "ENSMUSG00000044783",
        "ENSMUSG00000023505",
        "ENSMUSG00000020737",
        "ENSMUSG00000006398",
        "ENSMUSG00000038379",
        "ENSMUSG00000044201",
        "ENSMUSG00000028678",
        "ENSMUSG00000021693",
        "ENSMUSG00000046755",
        "ENSMUSG00000022391",
        "ENSMUSG00000038252",
        "ENSMUSG00000037544",
        "ENSMUSG00000048922",
        "ENSMUSG00000028873",
        "ENSMUSG00000027699",
        "ENSMUSG00000032254",
        "ENSMUSG00000020330",
        "ENSMUSG00000041362",
        "ENSMUSG00000027496",
        "ENSMUSG00000068744",
        "ENSMUSG00000036777",
        "ENSMUSG00000004880",
        "ENSMUSG00000040549",
        "ENSMUSG00000045328",
        "ENSMUSG00000005698",
        "ENSMUSG00000026622",
        "ENSMUSG00000035293",
        "ENSMUSG00000074802",
        "ENSMUSG00000050612",
        "ENSMUSG00000009575",
        "ENSMUSG00000029177",
        "ENSMUSG00000002870",
        "ENSMUSG00000028884",
        "ENSMUSG00000034329"
      ),
      symbol = c(
        "Mcm5",
        "Pcna",
        "Pcna-ps2",
        "Tyms",
        "Fen1",
        "Mcm7",
        "Mcm4",
        "Rrm1",
        "Ung",
        "Gins2",
        "Mcm6",
        "Cdca7",
        "Dtl",
        "Prim1",
        "Uhrf1",
        "Uhrf2",
        "Cenpu",
        "Hells",
        "Rfc2",
        "Polr1b",
        "Nasp",
        "Rad51ap1",
        "Gmnn",
        "Wdr76",
        "Slbp",
        "Ccne2",
        "Ubr7",
        "Pold3",
        "Msh2",
        "Atad2",
        "Atad2b",
        "Rad51",
        "Rrm2",
        "Rrm2b",
        "Cdc45",
        "Cdc6",
        "Exo1",
        "Tipin",
        "Dscc1",
        "Blm",
        "Casp8ap2",
        "Usp1",
        "Clspn",
        "Pola1",
        "Chaf1b",
        "Mrpl36",
        "E2f8",
        "Hmgb2",
        "Cdk1",
        "Nusap1",
        "Ube2c",
        "Ube2u",
        "Birc5",
        "Tpx2",
        "Top2a",
        "Top2b",
        "Ndc80",
        "Cks2",
        "Nuf2",
        "Cks1b",
        "Cks1brt",
        "Mki67",
        "Tmpo",
        "Cenpf",
        "Tacc3",
        "Pimreg",
        "Smc4",
        "Ccnb2",
        "Ckap2l",
        "Ckap2",
        "Aurkb",
        "Aurkc",
        "Bub1",
        "Kif11",
        "Anp32e",
        "Snrpa1",
        "Tubb4b",
        "Tubb2a",
        "Tubb2b",
        "Tubb4a",
        "Tubb5",
        "Tubb1",
        "Tubb3",
        "Tubb6",
        "Gtse1",
        "Kif20b",
        "Hjurp",
        "Cdca3",
        "Jpt1",
        "Cdc20",
        "Ttk",
        "Cdc25c",
        "Kif2c",
        "Kif2a",
        "Kif2b",
        "Rangap1",
        "Ncapd2",
        "Dlgap5",
        "Cdca2",
        "Cdca8",
        "Ect2",
        "Kif23",
        "Hmmr",
        "Shtn1",
        "Aurka",
        "Psrc1",
        "Anln",
        "Lbr",
        "Ckap5",
        "Cenpe",
        "Ctcf",
        "Nek2",
        "G2e3",
        "Gas2l3",
        "Txndc2",
        "Cbx5",
        "Cenpa",
        "Mcm2",
        "Rpa2",
        "Brip1"
      )
    ),
    class = "data.frame",
    row.names = c(NA, -120L)
  )
