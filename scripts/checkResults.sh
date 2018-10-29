#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# target env : os.env("TARGET_ENV"), or else first argument, or else 'master'
DEFAULT_ENV=${TARGET_ENV:-$1}
ENV=${DEFAULT_ENV:-master}

BUILD_DIR="${DIR}/../docs/${ENV}"
LAST_EXIT_CODE=$(cat ${BUILD_DIR}/EXIT_CODE 2>/dev/null || echo 404)
echo " * ${ENV} exit code were ${LAST_EXIT_CODE}";
exit $((LAST_EXIT_CODE));
