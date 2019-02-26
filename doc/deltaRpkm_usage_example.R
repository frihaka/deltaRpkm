##############################################
# A quick script to test deltaRpkm R package #
##############################################


# 1 - download deltaRpkm package binary from GitHub (choose the one relevant to your OS)

# 2 - install from terminal with the following command:
# R CMD INSTALL deltaRpkm_0.1.0_R_x86_64-pc-linux-gnu.tar.gz  # for Ubuntu 14.04 for example

# 3 - R dependencies
# Make sure that basic CRAN packages are already in your system, like ggplot2, dplyr...if not install via install.packges("pkg_name")
# Make sure that Bioconductor packages "sva" and "Biostrings" are installed
# for R >= 3.5
# > if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("sva", version = "3.8")
#
# > if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("Biostrings", version = "3.8")
#
# # for R <= 3.4
# source("https://bioconductor.org/biocLite.R")
# biocLite("sva")
# biocLite("Biostrings")




library("deltaRpkm")
library("ggfortify")  # install.packages("ggfortify") if not already on your libs


# load datasets
data("coverage_table_N11")
data("metadata_table_N11")
design_table <- loadMetadata(user_metadata = metadata_table_N11,
                             delta_phenotype_colname = "lineage_type",
                             heatmapbar_phenotype_colname = "infection",
                             samples_colname = "sample",
                             genome_length_colname = "genome_length",
                             mapped_reads_colname = "mapped_reads")

# convert reads to RPKM
rpkmtable <- rpkm(user_metadata = design_table,
                  coverage_table = coverage_table_N11,
                  delta_phenotype_colname = "lineage_type",
                  heatmapbar_phenotype_colname = "infection")


# correct for batch effect
rpkmtable <- batchCorrectRpkm(batch_colname = "platform",
                                   batch_info_table = metadata_table_N11,
                                   rpkm_table = rpkmtable,
                                   sample_colname = "sample",
                                   delta_phenotype_colname = "lineage_type",
                                   heatmapbar_phenotype_colname = "infection")

# compute deltaRPKM
deltarpkm_table <- deltarpkm(rpkm_table = rpkmtable,
                             genes_names = unique(rpkmtable$geneID),
                             samples_colname = "sample",
                             delta_phenotype_colname = "lineage_type",
                             reference_sample = "JF5203",
                             nonref_delta_phenotype = "Lineage_II")


# Get differentially present genes
stats_table <- deltaRPKMStats(deltarpkm_table = deltarpkm_table)
differential_present_genes <- unique(stats_table[stats_table$selected_gene %in% "+", ]$geneID)
median_plot(data_table = stats_table,
            gene_annotation_table = coverage_table_N11)


# Heatmap
heatmap_table <- subsetRPKMTable(rpkm_table = rpkmtable,
                                 user_metadata = design_table,
                                 delta_phenotype_colname = "lineage_type",
                                 heatmapbar_phenotype_colname = "infection",
                                 sd_filtered_genes = differential_present_genes)

heatmap_matrix <- convertHeatmapToMatrix(wide_rpkm_table = heatmap_table,
                                         delta_phenotype_colname = "lineage_type",
                                         heatmapbar_phenotype_colname = "infection")

rpkmHeatmap(filtered_rpkm_matrix = heatmap_matrix,
            user_metadata = design_table,
            heatmapbar_phenotype_colname = "infection")







