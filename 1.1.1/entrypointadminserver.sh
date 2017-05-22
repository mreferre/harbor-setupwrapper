#!/bin/bash

ENV_FILE="/configadminserver/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

/harbor/harbor_adminserver