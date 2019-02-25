
# Download binary file from https://github.com/frihaka/deltaRpkm/
# decompress
# Install from command line
# R CMD INSTALL deltaRpkm_binary

# run test

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
            coverage_table = coverage_table_N51[, c("start", "end", "geneID")])


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







