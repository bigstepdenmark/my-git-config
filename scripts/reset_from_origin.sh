#!/bin/bash
 
# Function to display the confirmation prompt
while true; do
    read -p "Do you want to proceed? (YES/NO/CANCEL) " yn
    case $yn in
        [Yy]* ) echo "" && git reset --hard $(git rev-parse --abbrev-ref --symbolic-full-name @{u}) && echo "" && return 0;;
        [Nn]* ) return 1;;
        [Cc]* ) return 1;;
        * ) echo "Please answer YES, NO, or CANCEL.";;
    esac
done
