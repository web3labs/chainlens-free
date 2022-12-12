#!/usr/bin/env bash
set -eu

NAMESPACE="sirato-explorer"
ENDPOINT=""

if [ $# -eq 1 ]; then
  echo "Using endpoint: $1"
  ENDPOINT=$1
else
  echo "Usage: $0 <RPC_URL>"
  echo "Example: $0 https://your.evm.net:8545/"
  exit 1
fi

kubectl create namespace $NAMESPACE

kubectl create -n $NAMESPACE -f mongodb.yml
sed "s|{{NODE_ENDPOINT}}|$ENDPOINT|g" ingestion.yml | kubectl create -n $NAMESPACE -f -
sed "s|{{NODE_ENDPOINT}}|$ENDPOINT|g" api.yml | kubectl create -n $NAMESPACE -f -
kubectl create -n $NAMESPACE -f web.yml,proxy.yml

kubectl get pods -n $NAMESPACE
kubectl get svc -n $NAMESPACE

echo -e "\n🎉 If you are in Minikube you can run 'minikube service sirato-proxy -n ${NAMESPACE}' to get an ingress URL"
