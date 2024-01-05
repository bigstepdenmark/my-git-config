#!/bin/bash

echo "---------------------------------------------------"
echo "- Fetching all tags from remote..."
echo "---------------------------------------------------"
git fetch --all --tags
echo "---------------------------------------------------"
echo "- Checkout from tag $1 to branch $2"
echo "---------------------------------------------------"
git checkout tags/$1 -b $2
echo ""
git ll
echo ""
