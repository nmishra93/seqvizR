# Nitesh Mishra
# 2023-12-28
# GitHub Repository: https://github.com/nmishra93/seqvizR

# Script Overview:
# This R script processes a set of amino acid sequences assumed to be of equal
# length, typically used in sequence alignments. It reads the sequences from
# a file named "seqs.txt" and modifies each sequence based on a reference
# sequence (hook) obtained from the first sequence. The modified sequences
# are stored in the 'result' vector. The script then generates a visual
# representation of the modified sequences using ggplot2, depicting residue
#  variations at each position across multiple sequences.

# Detailed Explanation:

# Load necessary libraries
library(ggplot2)
theme_set(
  ggthemes::theme_few()
)

# Step 1: Read amino acid sequences from a file named "seqs.txt" into aa_seqs
aa_seqs <- readLines("data/seqs.txt")

# Step 2: Determine the length of the sequences and set
# the initial and final positions for processing
seq_length <- nchar(aa_seqs[1])
start_pos <- 1L
end_pos <- seq_length
# Extract a substring from the first sequence using the specified
# start and end positions and assign it to the hook variable
hook <- substring(aa_seqs[1], start_pos, end_pos)

# Step 3: Process each gene sequence
result <- character(length(aa_seqs))

# Step 4: Iterate through each sequence in aa_seqs using lapply
result <- lapply(aa_seqs, function(seq) {
  # Initialize the modified sequence as an empty string
  result_seq <- substring(seq, 1, start_pos - 1)

  # Step 5: Compare each amino acid with the hook sequence
  for (aa_index in start_pos:end_pos) {
    # Calculate the corresponding index in the hook sequence
    hook_index <- aa_index - (start_pos - 1)

    # Check if the amino acid in the current position matches
    # the corresponding position in the hook sequence
    if (substring(
      seq, aa_index, aa_index
    ) == substring(
      hook, hook_index, hook_index
    )) {
      # If there is a match, append a dot to result_seq
      result_seq <- paste0(result_seq, ".")
    } else {
      # If there is no match, append the actual amino acid to result_seq
      result_seq <- paste0(result_seq, substring(seq, aa_index, aa_index))
    }
  }

  # Append the remaining part of the sequence after the end_pos to result_seq
  result_seq <- paste0(result_seq, substring(seq, end_pos + 1))

  # Return the modified sequence
  result_seq
})

result <- unlist(result)

# Step 6: `result` now contains the modified sequences

# Step 7: Remove all variables from the global environment
# except aa_seqs and result
rm(list = setdiff(ls(), c("aa_seqs", "result")), envir = .GlobalEnv)

# Step 8: Create a data frame for ggplot2
sequence_names <- seq_along(result)

alignment_df <- tibble(
  sequence_name = rep(sequence_names, each = nchar(result[1])),
  position = rep(1:nchar(result[1]), times = length(result)),
  residue = unlist(strsplit(result, ""))
) |>
  mutate(
    sequence_name = factor(sequence_name),
    position = factor(position),
    rug_position = as.numeric(sequence_name)
  )

# Step 9: Plot the sequence alignment using ggplot2
alignment_df |>
  ggplot(
    aes(
      x = position,
      xend = position,
      y = rug_position - 0.3,
      yend = rug_position + 0.3,
      color = residue
    )
  ) +
  geom_segment(
    linewidth = 0.3,
  ) +
  coord_cartesian(
    expand = FALSE
  ) +
  scale_color_manual(values = c("." = "white", "A" = "red", "E" = "blue", "F" = "green", "I" = "purple", "K" = "orange", "L" = "yellow", "Q" = "pink", "R" = "brown", "S" = "cyan", "Y" = "magenta", "-" = "gray")) +
  scale_y_continuous(
    breaks = 1:20,
    labels = sequence_names
  ) +
  scale_x_discrete(
    breaks = seq(0, 60, 5),
    labels = seq(0, 60, 5)
  ) +
  labs(
    x = "Position",
    y = ""
  ) +
  guides(color = guide_legend(
    title = "Residue",
    nrow = 1
  )) +
  theme(
    axis.text = element_text(size = 9),
    axis.title = element_text(size = 10),
    legend.position = "bottom",
    panel.border = element_blank(),
    axis.ticks = element_line(linewidth = 0.1),
    axis.ticks.length = unit(0.1, "cm"),
  )
