# deltaRpkm
An R package for a rapid differential gene presence analysis between large datasets of similar bacterial genomes

# Background 
deltaRpkm is an R package whose main purpose is to quickly identify genes potentially involved in a given phenotype by performing a _differential analysis of genes coverage between two sets of closely related bacterial genomes_. <br>
The package provides functions to compute the **RPKM**, the **deltaRPKM**, identify candidate genes filtering and make heatmap plots.  <br>
It also includes methods to perform some batch effects controls and diagnostics plots.

# Install 
Download (from the deltaRpkm/bin repo) the binary file that is specific to your system:

``` # download the relevant binary for your platform
deltaRpkm_0.1.0_ubuntu14.tar.gz      # Ubuntu (14 LTS)
deltaRpkm_0.1.0_ubuntu18.tar.gz      # Ubuntu (18 LTS)
deltaRpkm_0.1.0_mac.tgz              # MacOS (10.13)  
deltaRpkm_0.1.0.zip                  # Windows10 
```
and then, on a terminal on your local working directory:

```
# install the package on your system, from the terminal:  
R CMD INSTALL path/2/deltaRpkm_0.1.0_ubuntu14.tar.gz
```
Note that any missing CRAN or Bioconductor packages required by deltaRpkm need to be installed accordingly.

Alternatively, it can be installed from inside R/RStudio as:
```
> install.packages("path/2/deltaRpkm_0.1.0_ubuntu14.tar.gz", repos = NULL, dependencies = TRUE)
```
This will install any missing **CRAN** R packages required by deltaRpkm. But missing Bioconductor packages will still need to be installed accordingly.



# Usage
See: <br>
1. the **Wiki** (https://github.com/frihaka/deltaRpkm/wiki/Quick-Start-to-deltaRpkm) tab on the GitHub repo for a quick start <br>
2. the test R script (doc/**deltaRpkm_usage_example.R**) to play with the main methods and parameters of the pipeline <br>
3. the User Manual (doc/**deltaRpkm_User_Manual.pdf**) for a detailed tutorial <br>

