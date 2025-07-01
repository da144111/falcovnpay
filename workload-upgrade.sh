#!/bin/sh

NOCOLOR='\033[0m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'

SITE=${1}

echo -e "${LIGHTGREEN}[INFO] Upgrading to the last commit ${CI_COMMIT_BEFORE_SHA}...${NOCOLOR}"
if [[ ${SITE} != "" ]]; then
    listOfChange=$(git diff --diff-filter=d --name-only $CI_COMMIT_BEFORE_SHA | grep ${SITE})

    echo -e "${LIGHTGREEN}[INFO] Showing changes information: ${NOCOLOR}"
    git --no-pager diff $CI_COMMIT_BEFORE_SHA

    echo -e "${LIGHTGREEN}[INFO] Showing list of changed files: ${NOCOLOR}"
    echo ${listOfChange}
fi