#!/bin/bash

echo ---------------- Deleting Epirus-mogodb PoD and Service ----------------
kubectl delete -f mongodb-deployment.yml

echo ---------------- Deleting Epirus-web PoD and Service ----------------
kubectl delete -f web-deployment.yml

echo ---------------- Deleting Epirus-api PoD and Service ----------------
kubectl delete -f api-deployment.yml

echo ---------------- Deleting Epirus-ingestion PoD ----------------
kubectl delete -f ingestion-deployment.yml

echo ---------------- Deleting Proxy PoD ----------------
kubectl delete -f proxy.yml

echo ---------------- Deleting vmbc-sirato Namespace ----------------
kubectl delete namespace sirato-explorer

echo ---------------- Removing tmp files ----------------
rm -rvf mongodb-deployment.yml web-deployment.yml api-deployment.yml ingestion-deployment.yml proxy.yml 

echo ========================== DONE ===========================
