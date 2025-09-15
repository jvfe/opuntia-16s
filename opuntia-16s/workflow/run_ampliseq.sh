#!/bin/bash

nextflow run ./workflow/ampliseq-2.10.0/ \
  -profile docker \
  -resume \
  --single_end \
  --picrust \
  --ignore_failed_filtering \
  --dada_ref_tax_custom "data/dada2_reference/silva_nr99_v138.1_wSpecies_train_set.fa.gz" \
  --skip_qiime \
  --dada_ref_tax_custom_sp "data/dada2_reference/silva_species_assignment_v138.1.fa.gz" \
  --input "data/ampliseq_samplesheet.tsv" \
  --metadata "data/ampliseq_metadata.tsv" \
  --FW_primer CCTACGGGNGGCWGCAG \
  --RV_primer GACTACHVGGGTATCTAATCC \
  --outdir "ampliseq_results"

