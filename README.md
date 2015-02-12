seqstats
========


## Biological Sequence Statistics in R

The `seqstats` package aims to provide users with an easy to use statistical framework to perform biological sequence analyses in bioinformatics research.

## Fast Installation Guide

```r
# install.packages("devtools")

# install the current version of seqstats to your system
library(devtools)
install_github("HajkD/seqstats", build_vignettes = TRUE, dependencies = TRUE)

# On Windows, this won't work - see ?build_github_devtools
install_github("HajkD/seqstats", build_vignettes = TRUE, dependencies = TRUE)

# When working with Windows, first you need to install the
# R package: rtools -> install.packages("rtools")

# Afterwards you can install devtools -> install.packages("devtools")
# and then you can run:

devtools::install_github("HajkD/seqstats", build_vignettes = TRUE, dependencies = TRUE)

# and then call it from the library
library("seqstats", lib.loc = "C:/Program Files/R/R-3.1.1/library")

```

## Tutorials

The following tutorials will introduce you to the
functionality of `seqstats` :

- [Sequence Statistics](https://github.com/HajkD/seqstats/blob/master/vignettes/Statistics.Rmd)



## Discussions and Bug Reports

I would be very happy to learn more about potential improvements of the concepts and functions
provided in this package.

Furthermore, in case you find some bugs or need additional (more flexible) functionality of parts
of this package, please let me know:

hajk-georg.drost@informatik.uni-halle.de





