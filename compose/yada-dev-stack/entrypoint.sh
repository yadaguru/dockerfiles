#!/bin/bash

cd /opt/yadaguru-api
npm install

echo "Starting Yadaguru API in development mode"
nodemon --debug ./index.js
