#!/bin/bash
# Used below site to make up steps in deploying static file to Doudoumba.com
# https://pages.github.com/

echo -e "\033[0;32mDeploying updates to GitHub and Doudoumba.com site ...\033[0m"

# remove existing static site
rm -rf public 

# Build the project to \public 
hugo 

# Copy \public to Doudoumba static location
cp -rf public/*.* ../philippelincy.github.io/

# Go To Philippe Lincy Doudoumba
cd ../philippelincy.github.io

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

echo -e "\033[0;32mUploding to Doudoumba.com site ...\033[0m"
# Push source and build repos.
git push origin master

echo -e "\033[0;32m--------------------------------------\033[0m"
git status

# Come Back up to the Project Root
cd ../doudoumba