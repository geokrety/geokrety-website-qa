#!bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

CHROMEDRIVER_VERSION=2.42
CHROMEDRIVER_FILE=chromedriver_win32.zip
CHROMEDRIVER_BIN=chromedriver.exe

PIPCMD=pip
# PIPCMD=/c/programmes/Python37/python.exe -m pip

if [ ! "${OS}" == "Windows_NT" ]; then
   echo "unsupported OS ${OS}"
   exit 1
fi
pushd "${DIR}/.." > /dev/null
echo " * Requirement Chromedriver"
if [ ! -f ${CHROMEDRIVER_FILE} ]; then
  echo "Download ${CHROMEDRIVER_FILE} (${CHROMEDRIVER_VERSION})"
  curl https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/${CHROMEDRIVER_FILE} --output ${CHROMEDRIVER_FILE} || exit 1
  if [ ! -f ${CHROMEDRIVER_BIN} ]; then
    unzip ${CHROMEDRIVER_FILE} || exit 1
  fi
fi

echo " * Requirement pip"
which pip || exit 1
${PIPCMD} install --upgrade pip || exit 1
${PIPCMD}  -V || exit 1
${PIPCMD}  install -r requirements.txt || exit 1

echo " * Requirements OK"
popd > /dev/null