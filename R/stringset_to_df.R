# seq_ds as an example
# should work on any dna/aa stringset object
# --------------------------------------------------------------
source(
    "R/df_to_stringset.R"
)
# --------------------------------------------------------------
# Changing the DNAStringSet object into a data.frame
as.character(seq_ds) |>
    as.data.frame()
