#!/bin/bash

read -p 'Enter the .rmd file you wish to render: ' File
read -p 'Do you wish to clean it and remove the "=>"? Answer as y/n ' Clean

if [[ -e "$File" ]] ; then
    if [["$Clean" == 'y']]; then
        sed -i 's/=>/\$\\rightarrow\$/g' $File
        cp $File tmp.rmd
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
