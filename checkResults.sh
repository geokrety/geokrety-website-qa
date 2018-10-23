#!/bin/bash

# target env : os.env("TARGET_ENV"), or else first argument, or else 'master'
DEFAULT_ENV=${TARGET_ENV:-$1}
ENV=${DEFAULT_ENV:-master}

BUILD_DIR=docs/${ENV}
LAST_EXIT_CODE=$(cat ${BUILD_DIR}/EXIT_CODE)
echo " * ${ENV} exit code were ${LAST_EXIT_CODE}";
exit $((LAST_EXIT_CODE));