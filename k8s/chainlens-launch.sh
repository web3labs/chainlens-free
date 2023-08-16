#!/usr/bin/env bash
set -eu

NAMESPACE="chainlens-explorer"
ENDPOINT=""
DISPATCHER_RATE="10"

function usage() {
  if [ -n "$1" ]; then echo -e "\033[0;31m$1\033[0m\n"; fi;
  echo -e "Usage: $0 [-r millis] rpc_url"
  echo -e "  -r, --dispatch-rate\tThe ingestion rate in milliseconds (default 10 ms)"
  echo -e "  rpc_url\t\tThe RPC endpoint URL"
  echo ""
  echo "Example: $0 https://your.evm.net:8545/"
  exit 1
}

if [ "$#" -lt 1 ]; then usage ""; fi;

while [[ "$#" > 0 ]]; do case $1 in
  -r|--dispatch-rate) DISPATCHER_RATE="$2";shift;shift;;
  -*|--*) usage "Unknown parameter: $1";shift;;
  *) ENDPOINT="$1";shift;;
esac; done

if [ -z "$ENDPOINT" ]; then usage "Endpoint is not set"; fi;
if [ -z "$DISPATCHER_RATE" ]; then usage "Dispatch rate is not set"; fi;

kubectl create namespace $NAMESPACE

kubectl create -n $NAMESPACE -f mongodb.yml
sed -e "s|{{NODE_ENDPOINT}}|$ENDPOINT|g" -e "s|{{DISPATCHER_RATE}}|$DISPATCHER_RATE|g" ingestion.yml | kubectl create -n $NAMESPACE -f -
sed "s|{{NODE_ENDPOINT}}|$ENDPOINT|g" api.yml | kubectl create -n $NAMESPACE -f -
kubectl create -n $NAMESPACE -f web.yml,proxy.yml

kubectl get pods -n $NAMESPACE
kubectl get svc -n $NAMESPACE

echo -e "\n🎉 If you are in Minikube you can run 'minikube service chainlens-proxy -n ${NAMESPACE}' to get an ingress URL"
