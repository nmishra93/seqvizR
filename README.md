# seqvizR Repository Documentation

## Overview

Author: Nitesh Mishra  
Date: 2023-12-28  
GitHub Repository: [https://github.com/nmishra93/seqvizR](https://github.com/nmishra93/seqvizR)

## Description

The seqvizR repository contains an R script designed for processing amino acid sequences and visualizing sequence variations using ggplot2. This documentation provides an overview of the script's functionality, usage, and key components.

## Script Overview

The main script (`seqvizR_script.R`) performs the following tasks:

1. **Loading Libraries:**  
   The script loads the necessary libraries, including `tidyverse` and `ggthemes`.

2. **Reading Sequences:**  
   Amino acid sequences are read from a file named "seqs.txt" and stored in the `aa_seqs` variable.

3. **Processing Sequences:**  
   The script modifies each sequence based on a reference sequence (hook) obtained from the first sequence. The modified sequences are stored in the `result` vector.

4. **Data Preparation for Visualization:**  
   The script creates a data frame (`alignment_df`) suitable for visualization using ggplot2.

5. **Sequence Alignment Visualization:**  
   Using ggplot2, the script generates a visual representation of the modified sequences, depicting residue variations at each position across multiple sequences.

6. **Cleanup:**  
   Unnecessary variables are removed from the global environment to maintain a clean workspace.

## Usage

To use this script:

1. Clone the repository:  
   ```
   git clone https://github.com/nmishra93/seqvizR.git
   ```

2. Place your amino acid sequences in a file named "seqs.txt" inside the "data" directory.

3. Run the script:  
   ```
   Rscript seqvizR_script.R
   ```

4. The modified sequences and a visualization of sequence variations will be generated.

## Visualization Legend

The colors in the visualization represent different residues:

- "." (Dot): White
- "A": Red
- "E": Blue
- "F": Green
- "I": Purple
- "K": Orange
- "L": Yellow
- "Q": Pink
- "R": Brown
- "S": Cyan
- "Y": Magenta
- "-": Gray

## Dependencies

The script relies on the following R packages:

- `tidyverse`: A collection of packages for data manipulation and visualization.
- `ggthemes`: Additional themes for ggplot2.

Make sure to install these packages before running the script.

## Notes

- The script assumes that the input amino acid sequences are of equal length and stored in "seqs.txt".
- The resulting visualization provides insights into residue variations at each position across the input sequences.

Feel free to explore and modify the script based on your specific requirements. If you encounter any issues or have suggestions, please refer to the GitHub repository for support and contributions.

## Future plans
- color palettes based on amino acid properties such as chemistry, charge, polarity etc.
- generate theme_msa() and remove ggthemes dependency.
- generate a single function that will take the seq file and run the complete pipeline.