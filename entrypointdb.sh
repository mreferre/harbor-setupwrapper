#!/bin/bash

ENV_FILE="/configdb/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

/entrypoint.sh mysqld