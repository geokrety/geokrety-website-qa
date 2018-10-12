#!bin/bash

CHROMEDRIVER_VERSION=2.42
CHROMEDRIVER_FILE=chromedriver_win32.zip
CHROMEDRIVER_BIN=chromedriver.exe

if [ ! "${OS}" == "Windows_NT" ]; then
   echo "unsupported OS ${OS}"
   exit 1
fi

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

echo " * Requirements OK"
