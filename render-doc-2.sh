#!/bin/bash

# Modify this by making conditional based on if extension or not (if there is a ".")
read -p 'Enter the .rmd file you wish to render (without the extension): ' File
echo "$File".rmd

if [[ -e "$File".rmd ]]; then
    echo "Do you wish to clean the tmp .rmd file? "
    select yn in "Yes" "No" "Cancel"; do
        case $yn in
            Yes ) cp "$File".rmd tmp.rmd; sed -i 's/=>/\$\\rightarrow\$/g' tmp.rmd; R -e 'rmarkdown::render("tmp.rmd")'; rm tmp.rmd; mv tmp.pdf "$File".pdf; break;;
            No ) cp "$File".rmd tmp.rmd; R -e 'rmarkdown::render("tmp.rmd")'; rm tmp.rmd; mv tmp.pdf "$File".pdf; break;;
            Cancel ) exit;;
        esac
    done
    echo "Succesfully knitted the document (hopefully)"
else
    echo "File does not exist"
fi

