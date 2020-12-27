#! /bin/bash
# 
# set all git authors to random.j.farmer@gmail.com
#

git filter-branch -f --commit-filter '
   GIT_AUTHOR_NAME="Random J. Farmer";
   GIT_AUTHOR_EMAIL="random.j.farmer@gmail.com";
   git commit-tree "$@";
' HEAD

echo ''
echo 'git config user.name "Random J. Farmer"'
echo 'git config user.email "random.j.farmer@gmail.com"'
