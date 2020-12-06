#!/bin/bash -e

MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${MY_PATH}/_env.sh

# create tmp dir
TMP_DIR=$(mktemp -d)
trap "rm -rf ${TMP_DIR}" EXIT

# download data.tar.gz from s3
aws s3 cp "${S3_PATH}/docker-volumes-data.tar.bz" "${TMP_DIR}/docker-volumes-data.tar.bz"

# remove old data
rm -rf "${PROJECT_PATH}/docker-volumes/data"

# untar data
cd "${PROJECT_PATH}/docker-volumes"
tar -xjf "${TMP_DIR}/docker-volumes-data.tar.bz"
