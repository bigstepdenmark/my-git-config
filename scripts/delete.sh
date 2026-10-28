#!/usr/bin/env bash

type=$1
target=$2

case "$type" in
  commit)
    git reset --hard "$target"
    ;;
  branch)
    git branch -D "$target"
    ;;
  *)
    echo "Unknown type: $type"
    echo "Usage: git delete <commit|branch> <hash|name>"
    exit 1
    ;;
esac
