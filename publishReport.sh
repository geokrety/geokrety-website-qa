#!/bin/bash
PUBLICATION_BRANCH=gh-pages
# go to already cloned repo
REPO_PATH=$PWD
pushd $HOME/publish
#Update pages
cp -r $REPO_PATH/docs .
# Commit and push latest version
git add .
git config user.name  "Travis"
git config user.email "travis@travis-ci.org"
git commit -m "Updated QA tests "
git push -fq origin $PUBLICATION_BRANCH 2>&1 > /dev/null
PUSH_RESULT=$?
popd
if [ "${PUSH_RESULT}" == "0" ]; then
  echo "push $PUBLICATION_BRANCH SUCCESS";
else
  echo "push $PUBLICATION_BRANCH FAILED";
  exit 1
fi
echo " * done"
