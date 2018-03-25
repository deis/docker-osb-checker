#!/bin/bash
# Usage: ./test-api-compliance.sh host port timeout

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then echo "Usage: ./test-api-compliance.sh <host> <port> <timeout in seconds>"; exit 1; fi

set -e

HOST=$1
PORT=$2
TIMEOUT=$3

ls /config.json

ln -s /config.json /opt/osb-checker/2.13/tests/test/configs/config_mock.json

ls /opt/osb-checker/2.13/tests/test/configs/config_mock.json

# Wait for the apiserver to start responding
./wupiao.sh $HOST $PORT $TIMEOUT

exec bash -c mocha
