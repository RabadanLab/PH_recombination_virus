# PH_recombination_virus
Pipeline to infer recombination rates

# How to run:

Note that the pipeline needs the ripser software (which does Persistent Homology analyses) installed. It can be downloaded, and installed, in https://github.com/Ripser/ripser

In addition, R packages 'ape', 'pegas' and 'dataPreparation' need to be installed.
In fourth line of run_PH.sh the two numbers are window length and step size, respectively. It can be modified as desired.

Input file is the fasta alignment (e.g. those in ./data_examples). Fasta alignments must be in the same directory as the files from the pipeline.

Run the script run_PH.sh. Outputfiles will be in the directory ./outs.*

Predictions.rec.csv and predictions.RM.csv are tables with the inferred recombination rates (p) and recombination/mutation (r/m) rates inferred along the sequence alignment, respectively.
The second column is the alignment position where a given window ended. The third column is the inferred p (or r/m) for that window. Note that the inferred value for "window 0" is the overall rate inferred for the whole alignment.
