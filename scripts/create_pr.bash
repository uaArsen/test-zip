#!/bin/bash


repo="https://$DOCS_GITHUB_TOKEN@github.com/uaArsen/test-zip.git"
repo_name='test-zip'
current_time=$(date +'%s')
branch_name=docs-update-$projectName-$current_time
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

git config --global credential.helper store
git config --global user.email "arsenzhd@gmail.com"
git config --global user.name "uaArsen"
git clone $repo $HOME/$repo_name

cd $HOME/$repo_name || exit

git status
git checkout -b $branch_name

cp $path/README.md $HOME/$repo_name/content/_components/$projectName.md
git add $HOME/$repo_name/content/_components/$projectName.md
git commit -m"Update docs for component: $projectName"
git status
git push -q -u $repo origin $branch_name
git request-pull master $repo $branch_name