#!/bin/bash
# Execute robot framework tests
# assume python/pip is already installed
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
export PATH=$PATH:${DIR}/..

if [[ "${DIR}" == *"/travis/"* ]]; then
    export TRAVIS_FLAG=true
else
    export TRAVIS_FLAG=false
fi

echo " * scripts directory is ${DIR} (TRAVIS_FLAG:${TRAVIS_FLAG})"
pushd "${DIR}" > /dev/null

# requirements
REQUIREMENT_CHECK=.requirements_checked
if [[ -f ${REQUIREMENT_CHECK} ]]; then
  echo " * Requirement OK (remove ${REQUIREMENT_CHECK} to enforce check step)"
else
  . requirements.sh && touch ${REQUIREMENT_CHECK}
fi
#
# commands
ROBOT_CMD=robot
if [[ "${OS}" == "Windows_NT" ]]; then
   ROBOT_CMD=robot.exe
fi
#
# allowed target environments : don't forget trailing slash
# "master|https://staging.geokrety.org/"
ALLOWED_ENV=(
    "master|https://staging.geokrety.org/"
    "boly38|https://boly38.staging.geokrety.org/"
    "local|http://localhost:8000/"
    "feature/new-theme|https://new-theme.staging.geokrety.org/"
)
# allowed target test version: don't forget trailing slash
# "master|TestGeokrety"
ALLOWED_TEST_VERSION=(
    "master|TestGeoKrety"
    "boly38|TestGeoKretyV2"
    "local|TestGeoKretyV2"
    "feature/new-theme|TestGeoKretyV2"
)
#
# allowed BrowserStack target test version: don't forget trailing slash
ALLOWED_BS_TEST_VERSION=(
    "feature/new-theme|TestGeoKretyV2"
)
#
function getEnvUrl() {
  if [ "${GK_URL}" != "" ]; then
      echo ${GK_URL}
      return 0
  fi
  wantedEnv=$1
  resultUrl=""
  for envItem in "${ALLOWED_ENV[@]}"
  do
    env_name=$(echo "${envItem}"|awk -F "|" '{print $1}')
    env_url=$(echo "${envItem}"|awk -F "|" '{print $2}')
    if [[ "$wantedEnv" == "$env_name" ]]; then
      resultUrl=${env_url}
    fi;
  done
  echo ${resultUrl}
}
function getTestVersion() {
  wantedEnv=$1
  resultVersion=""
  for testItem in "${ALLOWED_TEST_VERSION[@]}"
  do
    env_name=$(echo "${testItem}"|awk -F "|" '{print $1}')
    test_version=$(echo "${testItem}"|awk -F "|" '{print $2}')
    if [[ "$wantedEnv" == "$env_name" ]]; then
      resultVersion=${test_version}
    fi;
  done
  echo ${resultVersion}
}
function getBSTestVersion() {
  wantedEnv=$1
  resultVersion=""
  for testItem in "${ALLOWED_BS_TEST_VERSION[@]}"
  do
    env_name=$(echo "${testItem}"|awk -F "|" '{print $1}')
    test_version=$(echo "${testItem}"|awk -F "|" '{print $2}')
    if [[ "$wantedEnv" == "$env_name" ]]; then
      resultVersion=${test_version}
    fi;
  done
  echo ${resultVersion}
}
function listListeningPorts() {
  echo " * list used ports"
  netstat -an|grep LISTEN
}

# target env : os.env("TARGET_ENV"), or else first argument, or else 'master'
DEFAULT_ENV=${TARGET_ENV:-$1}
ENV=${DEFAULT_ENV:-master}
BS_ENABLED=${BS_ENABLED:0}
# get conf associated to env
ENV_URL=$(getEnvUrl ${ENV})
if [[ "${ENV_URL}" == "" ]]; then
   echo " XXX Unsupported environment '${ENV}' (no target url)";
   exit 1
fi

if [[ "${BS_ENABLED}" == "1" ]]; then
    TEST_VERSION=$(getBSTestVersion ${ENV})
else
    TEST_VERSION=$(getTestVersion ${ENV})
fi
if [[ "${TEST_VERSION}" == "" ]]; then
   echo " XXX Unsupported environment '${ENV}' (no test version - bs:${BS_ENABLED})";
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

# DEBUG # to enforce a single test, uncomment the next line
# TARGET_TEST=00_GK_welcome.robot

TARGET_TESTS=acceptance/${TEST_VERSION}/${TARGET_TEST}
#
ENV_VARS_FILE="-V acceptance/vars/robot-vars.py"
# doc:  https://github.com/robotframework/robotframework/blob/master/doc/userguide/src/Appendices/CommandLineOptions.rst
ROBOT_CMD_ARGS="--loglevel DEBUG"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} --output output.xml"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} --debugfile debugfile.log"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} --log log.html"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} --report report.html"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} --xunit xUnit.xml"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} --variable browser:${BROWSER:-Firefox}"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} -d ${BUILD_DIR} ${ENV_VARS_FILE}"
ROBOT_CMD_ARGS="${ROBOT_CMD_ARGS} ${TARGET_TESTS}"

echo " * Execute robot framework tests |>>>${ENV}<<<| targetUrl=${ENV_URL} - targetTests=${TARGET_TESTS}"
echo "   ${ROBOT_CMD} ${ROBOT_CMD_ARGS}"
mkdir -p docs/${ENV}
${ROBOT_CMD} ${ROBOT_CMD_ARGS}

ROBOT_CMD_RESULT=$?
echo "${ROBOT_CMD_RESULT}">${BUILD_DIR}/EXIT_CODE

if ls /tmp/chromedriver_*.log 1> /dev/null 2>&1; then
  echo " * getting chrome driver logs"
  cp /tmp/chromedriver_*.log ${BUILD_DIR}
  ls -la ${BUILD_DIR}/chromedriver_*.log | wc -l
fi

if [[ "${ROBOT_CMD_RESULT}" == "0" ]]; then
  echo " * tests SUCCESS";
else
  echo " * tests FAILED";
fi

echo " * ${BUILD_DIR} :"
ls -la ${BUILD_DIR}

popd > /dev/null
popd > /dev/null
