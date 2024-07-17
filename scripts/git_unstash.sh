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

echo ""
# Check if there are no additional arguments
if [ -z "$1" ]; then
  # No additional arguments, run git stash list
  echo "---------------------------------------------------"
  echo " STASH LIST"
  echo " Create stash: git wip \"your_message\""
  echo " Re-apply stash: git unwip <INDEX_NUMBER>"
  echo "---------------------------------------------------"
  if [ -z "$(git stash list)" ]; then
    echo "${RED}Stash list is empty!${NORMAL}"
  else
    git stash list
  fi
else
  git stash pop stash@{$1}
fi
echo ""