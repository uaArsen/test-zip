#!/bin/sh

while getopts ":p:n:" opt; do
  case $opt in
    p) path="$OPTARG"
    ;;
    n) projectName="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done
echo 'Hello World' $path $projectName