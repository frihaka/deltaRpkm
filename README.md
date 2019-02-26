# deltaRpkm
An R package for a rapid differential gene presence analysis between similar genomes

# Background 
deltaRpkm is an R package whose main purpose is to quickly identify genes potentially involved in a given phenotype by performing a _differential analysis of genes coverage between two sets of closely related genomes_. <br>
The package provides functions to compute the **RPKM**, the **deltaRPKM**, identify candidate genes filtering and and make heatmap plot.  <br>
It also includes methods to perform some batch effects controls and diagnostics plots.

# Install 
Download (from the deltaRpkm/bin repo) the binary file that is specific to your system:

``` # download the relevant binary for your platform
deltaRpkm_0.1.0_R_x86_64-pc-linux-gnu.tar.gz      # Ubuntu (14.04 LTS)
deltaRpkm_0.1.0_mac.tgz                           # MacOS (10.13)  
deltaRpkm_0.1.0_win.zip                           # Windows7
```
and then on a terminal on your local working directory:
```# install the package on your system, from the terminal:  
R CMD INSTALL deltaRpkm_0.1.0_R_x86_64-pc-linux-gnu.tar.gz
```
# Usage
See: <br>
1. the **Wiki** (doc/Quick Start to deltaRpkm · frihaka_deltaRpkm Wiki.html) tab on the GitHub repo for a quick start <br>
2. the test R script (doc/deltaRpkm_usage_example.R) to play with the main methods and parameters of the pipeline <br>
3. the User Manual (**deltaRpkm_User_Manual.pdf** document in doc/) for a detailed tutorial <br>

