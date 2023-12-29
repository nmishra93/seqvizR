# Nitesh Mishra
# 2023-12-28
# GitHub Repository: [Your Repository Link]

# Script Overview:
# This R script is designed to process a set of amino acid sequences assumed to be of equal length, typically used in sequence alignments. It reads the sequences from a file named "seqs.txt" and modifies each sequence based on a reference sequence (hook) obtained from the first sequence. The modified sequences are stored in the 'result' vector.

# Detailed Explanation:

library(tidyverse)

theme_set(
    ggthemes::theme_few()
)
# Step 1: Read amino acid sequences from a file named "seqs.txt" into aa_seqs
aa_seqs <- readLines("data/seqs.txt")

# Step 2: Determine the length of the sequences and set the initial and final positions for processing
seq_length <- nchar(aa_seqs[1])
start_pos <- 1L
end_pos <- seq_length
# Extract a substring from the first sequence using the specified start and end positions and assign it to the hook variable
hook <- substring(aa_seqs[1], start_pos, end_pos)

# Step 3: Process each gene sequence
result <- character()

# Step 4: Iterate through each sequence in aa_seqs
for (seq in aa_seqs) {
    # Initialize the modified sequence as an empty string
    result_seq <- substring(seq, 1, start_pos - 1)

    # Step 5: Compare each amino acid with the hook sequence
    for (aa_index in start_pos:end_pos) {
        # Calculate the corresponding index in the hook sequence
        hook_index <- aa_index - (start_pos - 1)

        # Check if the amino acid in the current position matches the corresponding position in the hook sequence
        if (substring(seq, aa_index, aa_index) == substring(hook, hook_index, hook_index)) {
            # If there is a match, append a dot to result_seq
            result_seq <- paste0(result_seq, ".")
        } else {
            # If there is no match, append the actual amino acid to result_seq
            result_seq <- paste0(result_seq, substring(seq, aa_index, aa_index))
        }
    }

    # Append the remaining part of the sequence after the end_pos to result_seq
    result_seq <- paste0(result_seq, substring(seq, end_pos + 1))

    # Append the modified sequence to the result vector
    result <- c(result, result_seq)
}

# Step 6: `result` now contains the modified sequences

# Step 7: Remove all variables from the global environment except aa_seqs and result
rm(list = setdiff(ls(), c("aa_seqs", "result")), envir = .GlobalEnv)
