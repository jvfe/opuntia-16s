pathway_data <- read.delim(
  "ampliseq_results/picrust/METACYC_path_abun_unstrat_descrip.tsv",
  header = TRUE,
  sep = "\t",
  check.names = FALSE 
)

abundance_columns <- pathway_data[, 3:ncol(pathway_data)]

pathway_data$TotalAbundance <- rowSums(abundance_columns)

max_index <- which.max(pathway_data$TotalAbundance)

most_abundant_pathway_description <- pathway_data$description[max_index]

cat("The most abundant pathway is:", most_abundant_pathway_description, "\n")