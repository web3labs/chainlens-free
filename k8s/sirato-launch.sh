#!/usr/bin/env bash
set -e

NAMESPACE="sirato-explorer"

kubectl create namespace ${NAMESPACE}

cp api-deployment.yml.tmpl api-deployment.yml
cp ingestion-deployment.yml.tmpl ingestion-deployment.yml
cp mongodb-deployment.yml.tmpl mongodb-deployment.yml
cp web-deployment.yml.tmpl web-deployment.yml

kubectl create -f mongodb-deployment.yml,api-deployment.yml,ingestion-deployment.yml,web-deployment.yml
