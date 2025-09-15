# README

## 1\. Project Overview

This project focuses on the **characterization of the _Diaspis echinocacti_ microbiome** across a gradient of infestation on _Opuntia stricta_ using 16S rRNA amplicon sequencing. 🔬🌵

The sequencing data was generated using an **Illumina iSeq 100** platform and is publicly available.

- **Data Source**: BioProject **PRJNA1309975**
- **Inputs**: The FASTQ files and associated metadata are stored in the `data/` directory.

---

## 2\. How to Download

The raw sequencing data can be downloaded from the NCBI SRA using the accession number **PRJNA1309975**. The necessary scripts assume the data is located in the `data/sra_data/` directory. We kept only the forward reads (\_1) for sake of performance.

---

## 3\. How the Workflow Works

The workflow is stored in the `workflow/` directory and consists of three main scripts that perform the complete analysis, from raw reads to specific biological questions.

### Step 1 – Run Ampliseq Pipeline (`run_ampliseq.sh`)

**Purpose:** This is the main pipeline script that performs a full 16S rRNA amplicon analysis. It handles preprocessing of raw reads, quality control, feature table generation using DADA2, and taxonomic assignment.

**Tools:** `FastQC`, `Trimmomatic`, `DADA2 (via Rscript)`, `QIIME2`

**Inputs:**

- Raw paired-end FASTQ files (`data/sra_data/`)
- Sample metadata (`metadata.tsv`)

**Outputs:**

- DADA2 Amplicon Sequence Variant (ASV) table (`ampliseq_results/dada2/ASV_table.tsv`)
- Taxonomic assignments (`ampliseq_results/dada2/ASV_tax_species.user.tsv`)
- Picrust2 results

**Command:**

```bash
bash run_ampliseq.sh
```

---

### Step 2 – Genus/Species Analysis (`question_4.sh`)

**Purpose:** This script parses the DADA2 output to answer a specific taxonomic question: **What is the most abundant genus** across all samples?

**Tools:** `join`, `awk`, `sort`

**Inputs:**

- ASV abundance table (`ampliseq_results/dada2/ASV_table.tsv`)
- ASV taxonomy table (`ampliseq_results/dada2/ASV_tax_species.user.tsv`)

**Outputs:**

- The most abundant "Genus_Species" combination printed to the console.

**Command:**

```bash
bash question_4.sh
```

---

### Step 3 – Functional Pathway Analysis (`question_5.R`)

**Purpose:** This R script analyzes the predicted functional content from a PICRUSt2 analysis to answer the question: **What is the most abundant metabolic pathway** across all samples?

**Tools:** `R`, `base R functions`

**Inputs:**

- PICRUSt2 pathway abundance table (`ampliseq_results/picrust/METACYC_path_abun_unstrat_descrip.tsv`)

**Outputs:**

- The description of the most abundant metabolic pathway printed to the console.

**Command:**

```r
Rscript question_5.R
```
