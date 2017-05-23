#!/bin/bash

ENV_FILE="/configui/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

cp /data/secretkey /etc/ui/key

/harbor/harbor_ui 
