#!/bin/bash

if ( $# < 3 )
then
    echo "ERROR: Not enough parameters" 1>&2
    echo "SYNTAX: $0 <url> <user> <password> <email>"
    exit 1
fi

kubectl create secret docker-registry jfrog-pull-secret \
--docker-server=$1 \
--docker-username=$2 \
--docker-password=$3 \
--docker-email=$4