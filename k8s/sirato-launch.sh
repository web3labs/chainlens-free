#!/usr/bin/env bash
set -e

endpoint=""

if [ $# -eq 1 ]; then
  echo "Using endpoint: $1"
  endpoint=$1
else
  echo "Please specify a node endpoint"
  exit 1
fi

NAMESPACE="sirato-explorer"

kubectl create namespace ${NAMESPACE}

cp api-deployment.yml.tmpl api-deployment.yml
cp ingestion-deployment.yml.tmpl ingestion-deployment.yml
cp mongodb-deployment.yml.tmpl mongodb-deployment.yml
cp web-deployment.yml.tmpl web-deployment.yml
cp proxy.yml.tmpl proxy.yml

if [ "$ARCH" == "Darwin" ]; then
  sed -i '' "s|NODEENDPOINT|$endpoint|g" "ingestion-deployment.yml"
  sed -i '' "s|NODEENDPOINT|$endpoint|g" "api-deployment.yml"
else
  sed -i "s|NODEENDPOINT|$endpoint|g" "ingestion-deployment.yml"
  sed -i "s|NODEENDPOINT|$endpoint|g" "api-deployment.yml"
fi

kubectl create -f mongodb-deployment.yml,api-deployment.yml,ingestion-deployment.yml,web-deployment.yml,proxy.yml