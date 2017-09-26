#!/bin/bash

###############################################################
####      Renders .md file using R using knitr/pandoc      ####
###############################################################

# Difference from the other one
#   This uses a .md file rather than a .rmd file. Main reason is because there are nice vim plugins for .md and these files are not heavy on R code


# Dependencies
#   R
#   TeX (if you decide to output a pdf_document)
#   R packages: knitr

# To do
#   Make a function so this thing isn't messy as hell
#   Make the cleaning stuff functions so it is easier to examine

read -p 'Enter the .md file you wish to render (without the extension): ' File

if [[ -e "$File".md ]]; then
    echo "Do you wish to clean the tmp .rmd file? "
    select yn in "Yes" "No" "Cancel"; do
        case $yn in
            Yes ) cp "$File".md tmp.rmd; sed -i 's/=>/\$\\rightarrow\$/g' tmp.rmd; R -e 'rmarkdown::render("tmp.rmd")'; rm tmp.rmd; mv tmp.pdf "$File".pdf; break;;
            No ) cp "$File".md tmp.rmd; R -e 'rmarkdown::render("tmp.rmd")'; rm tmp.rmd; mv tmp.pdf "$File".pdf; break;;
            Cancel ) exit;;
        esac
    done
    echo "Succesfully knitted the document (hopefully)"
else
    echo "File does not exist"
fi

