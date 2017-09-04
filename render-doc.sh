#!/bin/bash

# Modify this by making conditional based on if extension or not (if there is a ".")
read -p 'Enter the .rmd file you wish to render (without the extension): ' File

# Cleaning refers to making a tmp file and:
#    - Converting => to $\rightarrow$ for LaTeX output
#    - Whatever else I decide to add in
read -p 'Do you wish to clean the .rmd file? Answer as y/n: ' Clean

if [[ -e "$File".rmd ]] ; then
    # Cleaning commands go in this conditional here
    if [[ echo "$Clean" | grep -iq "^y" ]]; then
        cp $File.rmd tmp.rmd
        sed -i 's/=>/\$\\rightarrow\$/g' tmp.rmd
        echo 'you said yes to clean'
    elif [["$Clean" == 'n']]; then
        cp $File tmp.rmd
    else
        echo "You didn't type y or n correctly..."
        exit
    fi

    R -e 'rmarkdown::render("tmp.rmd")'
    rm tmp.rmd
else
  # if it does not exist:
  echo 'File does not exist, better luck next time'
fi
