#!/bin/bash
# Execute robot framework tests
# assume python/pip is already installed
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"


if [[ "${DIR}" == *"/travis/"* ]]; then
    export TRAVIS_FLAG=true
else
    export TRAVIS_FLAG=false
fi

echo " * scripts directory is ${DIR} (TRAVIS_FLAG:${TRAVIS_FLAG})"
pushd "${DIR}" > /dev/null

# requirements
REQUIREMENT_CHECK=.requirements_checked
if [ -f ${REQUIREMENT_CHECK} ]; then
  echo " * Requirement OK (remove ${REQUIREMENT_CHECK} to enforce check step)"
else
  . requirements.sh && touch ${REQUIREMENT_CHECK}
fi
#
# commands
PYBOT=pybot
if [ "${OS}" == "Windows_NT" ]; then
   PYBOT=pybot.bat
fi
#
# allowed target environments : don't forget trailing slash
ALLOWED_ENV=(
    "master|https://rec.geokrety.org/"
    "boly38|https://boly38.gk.kumy.org/"
)
#
function getEnvUrl() {
  wantedEnv=$1
  resultUrl=""
  for envItem in "${ALLOWED_ENV[@]}"
  do
    env_name=$(echo "${envItem}"|awk -F "|" '{print $1}')
    env_url=$(echo "${envItem}"|awk -F "|" '{print $2}')
    if [ "$wantedEnv" == "$env_name" ]; then
      resultUrl=${env_url}
    fi;
  done
  echo ${resultUrl}
}
function listListeningPorts() {
  echo " * list used ports"
  netstat -an|grep LISTEN
}

#
# target env : os.env("TARGET_ENV"), or else first argument, or else 'master'
DEFAULT_ENV=${TARGET_ENV:-$1}
ENV=${DEFAULT_ENV:-master}
# get conf associated to env
ENV_URL=$(getEnvUrl ${ENV})
if [ "${ENV_URL}" == "" ]; then
   echo "Unsupported env ${ENV}";
   exit 1
fi

# prepare tests
export GEOKRETY_URL=${ENV_URL}
pushd "${DIR}/.." >/dev/null
BUILD_DIR=docs/${ENV}
#
echo " * clean old run"
if ls ${BUILD_DIR}/* 1> /dev/null 2>&1; then
  rm -f ${BUILD_DIR}/*
fi

# listListeningPorts

#
ENV_VARS_FILE="-V acceptance/vars/robot-vars.py"
# pybot arg doc:  https://github.com/robotframework/robotframework/blob/master/doc/userguide/src/Appendices/CommandLineOptions.rst
# PYBOT_ARGS=--dotted
# PYBOT_ARGS="--console verbose"
PYBOT_ARGS="--loglevel DEBUG"
PYBOT_ARGS="${PYBOT_ARGS} --output output.xml"
PYBOT_ARGS="${PYBOT_ARGS} --debugfile debugfile.log"
PYBOT_ARGS="${PYBOT_ARGS} --log log.html"
PYBOT_ARGS="${PYBOT_ARGS} --report report.html"
PYBOT_ARGS="${PYBOT_ARGS} --xunit xUnit.xml"
PYBOT_ARGS="${PYBOT_ARGS} -d ${BUILD_DIR} ${ENV_VARS_FILE}"

echo " * Execute robot framework tests |>>${ENV}<<<| targetUrl=${ENV_URL}"
echo "   PYBOT_ARGS:${PYBOT_ARGS}"

${PYBOT} ${PYBOT_ARGS} acceptance/TestGeoKrety/

PYBOT_RESULT=$?
echo "${PYBOT_RESULT}">${BUILD_DIR}/EXIT_CODE

if ls /tmp/chromedriver_*.log 1> /dev/null 2>&1; then
  echo " * getting chrome driver logs"
  cp /tmp/chromedriver_*.log ${BUILD_DIR}
  ls -la ${BUILD_DIR}/chromedriver_*.log | wc -l
fi

if [ "${PYBOT_RESULT}" == "0" ]; then
  echo " * tests SUCCESS";
else
  echo " * tests FAILED";
fi

echo " * ${BUILD_DIR} :"
ls -la ${BUILD_DIR}

popd > /dev/null
popd > /dev/null
