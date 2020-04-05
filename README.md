Respository contents

In this repository you will find:


run_analysis.R, an R script that processes that data and produces two new datasets:

	-DataMerge: a dataset corresponding to the one resulting of applying the steps 1-4 in the course assignment.
	-DataMergeMean: a dataset corresponding to the one described in the step 5, also submitted via the assignments submission form.

CodeBook.md: a codebook describing the new two datasets.

README.md: this file.

Running the script(s)

Running the script is quite simple:

1-Be sure to set your current working directory to the root directory of this project. It must include an "InputData" directory where the "UCI HAR Dataset" and all its subdirectories/files must be present (in other words: if you are not pulling all the repo structure, you must manually create an "InputData" directory and unzip the original dataset inside this directory)

2-Just source the script file:

source('run_analysis.R')

Once run, the script file will generate two new datasets (see previous section). Please note that these datasets are generated only in memory, and not saved to disk, thus, it only makes sense to run this script from an interactive session and then, if wanted, save the resulting datasets using something like:

write.table(DataMergeMean,file = "./new_dataset.txt",row.names=F)
