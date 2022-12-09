#!/bin/bash

echo ---------------- Deleting Epirus-mogodb PoD ----------------
kubectl delete -f mongodb-deployment.yml

echo ---------------- Deleting Epirus-web PoD ----------------
kubectl delete -f web-deployment.yml

echo ---------------- Deleting Epirus-api PoD ----------------
kubectl delete -f api-deployment.yml

echo ---------------- Deleting Epirus-ingestion PoD ----------------
kubectl delete -f ingestion-deployment.yml

echo ---------------- Removing web and api service ----------------
kubectl delete svc web-service api-service

echo ---------------- Removing tmp files ----------------
rm -rvf mongodb-deployment.yml web-deployment.yml api-deployment.yml ingestion-deployment.yml 

echo ========================== DONE ===========================