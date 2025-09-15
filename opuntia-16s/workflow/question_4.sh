echo "Most abundant genus is: " && join <(sort -k1 ampliseq_results/dada2/ASV_table.tsv) <(sort -k1 ampliseq_results/dada2/ASV_tax_species.user.tsv) | \
awk '{
    genus_column=16;
    species_column=17;
    total=0; 
    if ($genus_column != "") {
        for (i=2; i<=10; i++) {
            total+=$i
        } 
        # Print the combined Genus_Species and the total count
        print $genus_column "_" $species_column, total
    }
}' | \
awk '{
    a[$1]+=$2
} END {
    for (i in a) print i, a[i]
}' | \
sort -k2 -nr | head -n 1
