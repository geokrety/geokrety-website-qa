#!/bin/bash
# Windows way to execute robot framework test
# assume python/pip is already installed

# config
ENV=rec
CHROMEDRIVER_VERSION=2.42
CHROMEDRIVER_FILE=chromedriver_win32.zip
CHROMEDRIVER_BIN=chromedriver.exe
REQUIREMENT_CHECK=.requirements_checked

if [ -f ${REQUIREMENT_CHECK} ]; then
  echo " * Requirement OK (remove ${REQUIREMENT_CHECK} to enforce check step)"
else
  echo " * Requirement Chromedriver"
  if [ ! -f ${CHROMEDRIVER_FILE} ]; then
    echo "Download ${CHROMEDRIVER_FILE} (${CHROMEDRIVER_VERSION})"
    curl https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/${CHROMEDRIVER_FILE} --output ${CHROMEDRIVER_FILE}
    if [ ! -f ${CHROMEDRIVER_BIN} ]; then
      unzip ${CHROMEDRIVER_FILE}
    fi
  fi

  echo " * Requirement pip"
  pip install --upgrade pip
  pip -V
  pip install -r requirements.txt
  touch ${REQUIREMENT_CHECK}
fi

echo " * Execute robot framework tests (env=${ENV})"
ENV_VARS_FILE=acceptance/vars/${ENV}-dev.py
if [ ! -f ${ENV_VARS_FILE} ]; then
  echo "unable to load env ${ENV}: ${ENV_VARS_FILE} doesn't exist"
  exit 1;
fi
rm -f selenium-screenshot-*.png
pybot.bat -V ${ENV_VARS_FILE} acceptance/GK_welcome.robot