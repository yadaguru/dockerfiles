#!/bin/bash

cd /opt/yadaguru-api

echo "Starting Yadaguru API in development mode"
nodemon --debug ./index.js
