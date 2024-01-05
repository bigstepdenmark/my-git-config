#!/bin/bash

output=$(git config --global -l)

echo ${output//alias./hello.}
