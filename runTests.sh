#!/bin/bash
# Execute robot framework tests
# assume python/pip is already installed
#
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
export GEOKRETY_URL=${ENV_URL}
BUILD_DIR=docs/${ENV}
#
echo " * clean images"
if [ ! -f ${BUILD_DIR}/selenium-screenshot-0.png ]; then
  rm -f ${BUILD_DIR}/selenium-screenshot-*.png
fi
#
echo " * Execute robot framework tests |>>${ENV}<<<| targetUrl=${ENV_URL} buildDir=${BUILD_DIR}"
ENV_VARS_FILE="-V acceptance/vars/robot-vars.py"
${PYBOT} --dotted -d ${BUILD_DIR} ${ENV_VARS_FILE} acceptance/TestGeoKrety/
PYBOT_RESULT=$?
echo "${PYBOT_RESULT}">${BUILD_DIR}/EXIT_CODE
if [ "${PYBOT_RESULT}" == "0" ]; then
  echo "tests SUCCESS";
else
  echo "tests FAILED";
fi
