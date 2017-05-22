#!/bin/bash

ENV_FILE="/configjobservice/env"
if [ -f ${ENV_FILE} ]; then
    export $(cat $ENV_FILE | xargs)
fi  

/harbor/harbor_jobservice