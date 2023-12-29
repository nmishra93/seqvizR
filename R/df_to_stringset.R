# --------------------------------------------------------------
# Script Description:
# This R script converts a data frame containing DNA sequences into a DNAStringSet object
# using the Biostrings package. It reads a CSV file named "seq.csv" located in the "data" directory
# using the here package and creates a DNAStringSet object from the sequences.

# --------------------------------------------------------------
# Required Libraries:
library(Biostrings)

# --------------------------------------------------------------
# Function Definition:
# Define the DNAStringSet function from the Biostrings package with its parameters.

DNAStringSet(
    x = character(),
    start = NA,
    end = NA,
    width = NA,
    use.names = TRUE
)

# --------------------------------------------------------------
# Data Loading:
# Read the CSV file "seq.csv" located in the "data" directory using the here package
# and store it in the data frame named "seq_df".

seq_df <- read.csv(here::here("data", "seq.csv"))

# --------------------------------------------------------------
# Conversion to DNAStringSet:
# Convert the "seq" column in the data frame to a DNAStringSet object and store it in the same column.

seq_df$seq <- DNAStringSet(seq_df$seq)

# --------------------------------------------------------------
# Assigning Names:
# Create a DNAStringSet object from the sequences in "seq_df" and assign it to the variable "seq_ds".
# Extract names from the "seqname" column of the data frame and assign them as names to the DNAStringSet object.

seq_ds <- DNAStringSet(seq_df$seq)
names(seq_ds) <- seq_df$seqname

# --------------------------------------------------------------
# Summary:
# The resulting DNAStringSet object, "seq_ds," can be used for further analysis and manipulation
# of DNA sequences in R.
# --------------------------------------------------------------
