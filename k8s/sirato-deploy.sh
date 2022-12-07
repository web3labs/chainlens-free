#!/bin/bash

endpoint=""

if [ $# -eq 1 ]; then
  echo "Using endpoint: $1"
  endpoint=$1
else
  echo "Please specify a node endpoint"
  exit 1
fi

kubectl create namespace vmbc-epirus

NAMESPACE="vmbc-epirus"

cp epirus-net-networkpolicy.yml.tmpl epirus-net-networkpolicy.yml
cp api-deployment.yml.tmpl api-deployment.yml
cp ingestion-deployment.yml.tmpl ingestion-deployment.yml
cp mongodb-deployment.yml.tmpl mongodb-deployment.yml
cp web-deployment.yml.tmpl web-deployment.yml

kubectl apply -f epirus-net-networkpolicy.yml,mongodb-deployment.yml,web-deployment.yml
echo fetching mongodb IP.....
sleep 60
name=$(kubectl get pods | grep mongo | awk -F '1/1' '{print $1}')
ip=$(kubectl get pod $name  -o json |jq .status.podIP | tr -d '"')
echo $name
echo $ip
latest=$(echo $ip)
sed -i "s|IP|$latest|g" "ingestion-deployment.yml"
sed -i "s|IP|$latest|g" "api-deployment.yml"
sed -i "s|NODEENDPOINT|$endpoint|g" "ingestion-deployment.yml"
sed -i "s|NODEENDPOINT|$endpoint|g" "api-deployment.yml"

kubectl apply -f api-deployment.yml,ingestion-deployment.yml
kubectl expose deployment web --port=3000 --target-port=3000 --name=web-service --type=LoadBalancer
kubectl expose deployment api --port=8090 --target-port=8090 --name=api-service --type=LoadBalancer
