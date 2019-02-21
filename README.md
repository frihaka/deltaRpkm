# deltaRpkm
An R package for a rapid differential gene presence analysis between similar genomes

# Background 
deltaRpkm is an R package whose main purpose is to quickly identify genes potentially involved in a given phenotype by performing a _differential analysis of genes coverage between two sets of closely related genomes_. <br>
The package provides functions to compute the **RPKM**, the **deltaRPKM**, identify candidate genes filtering and and make heatmap plot.  <br>
It also includes methods to perform some batch effects controls and diagnostics plots.

# Install 
Download the binary file specific to your system and then on a terminal:

``` # decompress it
tar -xzvf deltaRpkm.tar.gz  \# Linux 
tar -xzvf deltaRpkm.gz      \# MacOs  
tar -xzvf deltaRpkm.zip     \# Windows  
```
```# install the package on the system:  
R CMD INSTALL deltaRpkm   <br>
```
