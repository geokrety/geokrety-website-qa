#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
pushd "${DIR}/.." > /dev/null

PUBLICATION_BRANCH=gh-pages
REPO_PATH=$PWD
echo " * get previous report (from $HOME)"
# work from HOME
pushd "$HOME" > /dev/null
git clone --quiet --branch ${PUBLICATION_BRANCH} --single-branch \
  https://${GITHUB_TOKEN}@github.com/geokrety/geokrety-website-qa.git publish 2>&1 >/dev/null
pushd "$HOME/publish" > /dev/null
echo " * imported previous reports:"
ls -lad ./*/ | awk '{print $5, $6, $7, $8, $9}'
cp -r ./*/ "${REPO_PATH}/docs/"
popd > /dev/null
popd > /dev/null
popd > /dev/null