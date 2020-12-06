#!/bin/bash
set -e

MY_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
MY_IP=`curl http://checkip.amazonaws.com`

echo MY_IP=${MY_IP}

${MY_DIR_PATH}/sudo_domain.sh geo.hivebedrock.network ${MY_IP}
${MY_DIR_PATH}/sudo_domain.sh hivebedrock.network ${MY_IP}
${MY_DIR_PATH}/sudo_domain.sh mco.mineplex.com ${MY_IP}
${MY_DIR_PATH}/sudo_domain.sh play.inpvp.net ${MY_IP}
${MY_DIR_PATH}/sudo_domain.sh mco.lbsg.net ${MY_IP}
${MY_DIR_PATH}/sudo_domain.sh mco.cubecraft.net ${MY_IP}
${MY_DIR_PATH}/sudo_domain.sh play.galaxite.net ${MY_IP}

# service bind9 restart
