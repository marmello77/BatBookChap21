# BatBookChap21

Supplement to chapter 21 of the book ["Phyllostomid Bats: A Unique Mammalian Radiation"](https://amzn.to/3mPryrI), edited by Theodore H. Fleming, Liliana M. Dávalos, and Marco A. R. Mello, and published by the University of Chicago Press.

If you want to buy our book, click [here](https://amzn.to/3mPryrI).

[Ecological Synthesis Lab](https://marcomellolab.wordpress.com) (SintECO).

Authors: Marco A. R. Mello & Renata L. Muylaert.

E-mail: marmello@usp.br. 

Published on September 22nd, 2020 (English version).

Run in R version 4.0.2 (2020-06-22) -- "Taking Off Again".

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4046004.svg)](https://doi.org/10.5281/zenodo.4046004)


Disclaimer: You may freely use the software provided here for any purposes at your own risk. We assume no responsibility or liability for the use of this software, convey no license or title under any patent, copyright, or mask work right to the product. We reserve the right to make changes in the software without notification. We also make no representation or warranty that such application will be suitable for the specified use without further testing or modification. If this software helps you produce any academic work (paper, book, chapter, monograph, dissertation, report or similar), please acknowledge the authors and cite the source.


## Functionality and origin

Here you will find the supplementary material of chapter 21 ["Network Science as a Framework for Bat Studies"](https://phyllostomids.weebly.com/chapters/network-science-as-a-framework-for-bat-studies), written by Marco A. R. Mello and Renata L. Muylaert.

We also provide scripts and data for reproducing the analyses and figures published in our chapter.


## List of folders and files

1. BatBookChap21.Rproj -> R project file. Run this file first, if you plan on running the codes directly from "chap21.R".

2. Tutorial.Rmd -> tutorial written in RMarkDown. You may prefer to run it instead of "chap21.R", if you are not so familiar with R.

3. Tutorial.PDF -> the same tutorial provided in "Tutorial.Rmd", but compiled as a PDF document.

4. Data (folder)

    a. chapter 21 supplement.xlsx -> main supplement of our chapter, mentioned in the book. It contains all the information extracted from the studies included in our systematic review. See the metadata tab inside for detailed descriptions.
  
5. Analysis (folder)
 
    a. chap21.R -> script for reproducing the analysis and figures.
    
    b. MyTriangle.R -> R function required for creating the diamond shape used in Fig.21.3, procuded with the code from "chap21.R".
    
    c. sarmento.txt -> data from the Sarmento bat-bird-plant network. Originally published by [Sarmento et al. (2014, Zoologia)](http://dx.doi.org/10.1590/S1984-46702014000300006).
    
    d. software.txt -> data from the software-reference network, compiled from "chapter 21 supplement.xlsx".
    
    e. studies.txt -> data from the studies included in our systematic review, compiled from "chapter 21 supplement.xlsx".
    
    f. figures 21.1 to 21.4.tiff -> figures produced with the code from "chap21.R".


## Feedback

If you have questions, corrections, or suggestions, feel free to open an [issue](https://github.com/marmello77/BatBookChap21/issues) or send us a [pull request](https://github.com/marmello77/BatBookChap21/pulls).


## Acknowledgments

We thank our sponsors, especially the Alexander von Humboldt-Stiftung, CNPq, CAPES, and FAPESP, who gave us grants, fellowships, and scholarships. Last, but not least, we thank the [Stack Overflow Community](https://stackoverflow.com), where we solve most of our coding dilemmas. This particular dilemma was solved in this [topic](https://stackoverflow.com/questions/64371998/function-to-abbreviate-scientific-names).


## Reference

Mello, M. A. R., and R. L. Muylaert. 2020. *Network Science as a Framework for Bat Studies*. Chapter 21 in T. H. Fleming, L. M. Dávalos, and M. A. R. Mello (Eds.) [Phyllostomid Bats: A Unique Mammalian Radiation](https://amzn.to/3mPryrI). University of Chicago Press, Chicago. 
