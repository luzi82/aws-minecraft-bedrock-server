#!/bin/bash
set -e

MY_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOMAIN=${1}
MY_IP=${2}

cat ${MY_DIR_PATH}/db.DOMAIN \
| sed -e "s/DOMAIN/${DOMAIN}/g" \
| sed -e "s/MY_IP/${MY_IP}/g" \
> /var/cache/bind/db.${DOMAIN}
