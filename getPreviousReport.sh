#!/bin/bash
PREVIOUS_DOCS=./previous_docs
echo " * get previous report"
rm -rf ${PREVIOUS_DOCS} || echo ""
git clone https://github.com/geokrety/geokrety-website-qa.git --branch gh-pages --single-branch ${PREVIOUS_DOCS}
rm -rf ${PREVIOUS_DOCS}/.git || echo "not a git repo"
echo " * imported previous reports:"
ls -d ${PREVIOUS_DOCS}/*/ || echo "nothing to import"
# get copy of latest reports
cp -rf ${PREVIOUS_DOCS}/boly38 docs/ 2>/dev/null || echo "no previous docs for boly38"
cp -rf ${PREVIOUS_DOCS}/master docs/ 2>/dev/null || echo "no previous docs for master"
