#!/bin/bash

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
LIME_YELLOW=$(tput setaf 190)
YELLOW=$(tput setaf 3)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# Hent Git repository URL
repo_url=$(git config --get remote.origin.url)
repo_baseurl="https://dev.azure.com/Domstolene/Skifte%20og%20Straffe/_git"

# Tjek om repo har en URL
if [ -z "$repo_url" ]; then
   echo "${RED}Ingen Git-repository fundet eller ingen remote origin sat."
   exit 1
fi

# Tjek om det er en SSH- eller HTTPS-URL og omdann til en browsbar URL
if [[ $repo_url == git@* ]]; then
   # Konverter SSH til HTTPS
   repo_url=$(echo "$repo_url" | sed -E 's/git@([^:]+):/https:\/\/\1\//')
elif [[ $repo_url == *.git ]]; then
   # Fjern .git fra slutningen af HTTPS-URL
   repo_url=${repo_url%.git}
fi

repo_name=$(basename "$repo_url")

# Print resultatet
echo "${GREEN}"
echo "-----------------------------------------------------------------------------"
echo "Mine PR: $repo_baseurl/$repo_name/pullrequests?_a=mine"
echo "-----------------------------------------------------------------------------"
echo "${NORMAL}"

xdg-open "$repo_baseurl/$repo_name/pullrequests?_a=mine" > /dev/null 2>&1 &