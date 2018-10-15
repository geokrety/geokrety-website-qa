#!/bin/bash
PREVIOUS_DOCS=./previous_docs
echo " * get previous report"
rm -rf ${PREVIOUS_DOCS} ||true
git clone https://github.com/geokrety/geokrety-website-qa.git --branch gh-pages --single-branch ${PREVIOUS_DOCS}
rm -rf ${PREVIOUS_DOCS}/.git || true
cp -rf ${PREVIOUS_DOCS}/boly38 docs/ 2>/dev/null || true
cp -rf ${PREVIOUS_DOCS}/master docs/ 2>/dev/null || true
echo " * imported previous reports:"
ls -d docs/*/
