#!bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"



function requirement_chromedriver() {
    echo " * Requirement Chromedriver"
    CHROMEDRIVER_VERSION=2.42
    CHROMEDRIVER_FILE=chromedriver_win32.zip
    CHROMEDRIVER_BIN=chromedriver.exe
    CHROMEDRIVER_URL=https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/${CHROMEDRIVER_FILE}
    if [ ! -f ${CHROMEDRIVER_FILE} ]; then
      echo "Download ${CHROMEDRIVER_FILE} (${CHROMEDRIVER_VERSION})"
      curl ${CHROMEDRIVER_URL} --output ${CHROMEDRIVER_FILE} || exit 1
      if [ ! -f ${CHROMEDRIVER_BIN} ]; then
        unzip ${CHROMEDRIVER_FILE} || exit 1
      fi
    fi
}

function requirement_geckodriver() {
    echo " * Requirement Geckodriver"
    GECKODRIVER_VERSION=v0.23.0
    GECKODRIVER_FILE=geckodriver-${GECKODRIVER_VERSION}-win64.zip
    GECKODRIVER_BIN=geckodriver.exe
    GECKODRIVER_URL=https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VERSION}/${GECKODRIVER_FILE}

    if [ ! -f ${GECKODRIVER_FILE} ]; then
      echo "Download ${GECKODRIVER_FILE} (${GECKODRIVER_VERSION})"
      curl -L ${GECKODRIVER_URL} --output ${GECKODRIVER_FILE} || exit 1
    fi
    if [ ! -f ${GECKODRIVER_BIN} ]; then
      unzip ${GECKODRIVER_FILE} || exit 1
    fi
}

function requirement_pip() {
    PIPCMD=pip
    # PIPCMD=/c/programmes/Python37/python.exe -m pip
    echo " * Requirement pip"
    which pip || exit 1
    ${PIPCMD} install --upgrade pip || exit 1
    ${PIPCMD}  -V || exit 1
    ${PIPCMD}  install -r requirements.txt || exit 1
}

if [ ! "${OS}" == "Windows_NT" ]; then
   echo "unsupported OS ${OS}"
   exit 1
fi
pushd "${DIR}/.." > /dev/null

# requirement_chromedriver
requirement_geckodriver
requirement_pip

echo " * Requirements OK"
popd > /dev/null