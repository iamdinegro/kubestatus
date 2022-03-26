#!/bin/bash
# Author: Diego Santana de Oliveira
# Email: diego.devops@hotmail.com
# Script to check Kubernetes Health
# How to use: sudo chmod +x ./checkstatus.sh && ./checkstatus.sh
# Script tested on bash version: 5.0.17 and Kubernetes Version 1.21
# Dependencies: jq (1.6 tested)

HEALTH_EMJ=$(perl -CO -E 'say "\N{U+2705}"')
NOTHEALTH_EMJ=$(perl -CO -E 'say "\N{U+274C}"')
read -p "APIServer IP or Domain (Without Port Number): E.g: [192.168.1.10]: " API_SERVER

checkApiServer() {
    STATUS=$(curl -k --silent "https://$API_SERVER:6443/readyz?&exclude=etcd")
    if [ "$STATUS" = "ok" ]; then
        echo "Api Server is healthful $HEALTH_EMJ"
    else
        echo "API Server is not healthful $NOTHEALTH_EMJ"
    fi
}
checkApiServer
