#!/bin/bash

MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PROJECT_PATH="${MY_PATH}"

export AWS_DEFAULT_REGION=ap-east-1

export S3_BUCKET=`cat conf.json | jq -r .S3_BUCKET`
export S3_PREFIX=`cat conf.json | jq -r .S3_PREFIX`

if [ "${S3_PREFIX}" != "null" ]; then
  export S3_PATH="s3://${S3_BUCKET}/${S3_PREFIX}"
else
  export S3_PATH="s3://${S3_BUCKET}"
fi
