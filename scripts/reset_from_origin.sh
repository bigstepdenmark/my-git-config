#!/bin/bash

while true; do
    read -p "Do you want to completely reset local repo to remote? (YES/NO/CANCEL) " yn
    case $yn in
        [Yy]* )
            echo ""

            git fetch --all --prune

            BRANCH=$(git rev-parse --abbrev-ref HEAD)

            git reset --hard "origin/$BRANCH"

            git clean -fdx

            echo ""
            echo "Local repository has been completely reset to origin/$BRANCH"
            return 0
            ;;
        [Nn]* ) return 1 ;;
        [Cc]* ) return 1 ;;
        * ) echo "Please answer YES, NO, or CANCEL." ;;
    esac
done