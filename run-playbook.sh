#!/bin/bash

set -e

function usage {
  echo "Usage: run-playbook.sh -u USER -r HOST"
}

unset USERNAME REMOTE_HOST

while getopts 'u:r:' c
do
  case $c in
    u) USERNAME=$OPTARG ;;
    r) REMOTE_HOST=$OPTARG ;;
  esac
done

if [[ -z "$USERNAME" || -z "$REMOTE_HOST" ]]; then
  usage
  exit 1
fi

ansible-playbook -i $USERNAME@$REMOTE_HOST, playbook.yml
