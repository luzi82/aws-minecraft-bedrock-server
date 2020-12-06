#!/bin/bash -e

MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${MY_PATH}/_env.sh

# create tmp dir
TMP_DIR=$(mktemp -d)
trap "rm -rf ${TMP_DIR}" EXIT

# create data.tar.gz
cd "${PROJECT_PATH}/docker-volumes"
tar -cjf "${TMP_DIR}/docker-volumes-data.tar.bz" data

# clone to s3
aws s3 cp "${TMP_DIR}/docker-volumes-data.tar.bz" "${S3_PATH}/docker-volumes-data.tar.bz"
