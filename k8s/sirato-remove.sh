#!/bin/bash

echo ---------------- Deleting sirato-network PoD ----------------
kubectl delete -f epirus-net-networkpolicy.yml

echo ---------------- Deleting sirato-mogodb PoD ----------------
kubectl delete -f mongodb-deployment.yml

echo ---------------- Deleting sirato-web PoD ----------------
kubectl delete -f web-deployment.yml

echo ---------------- Deleting sirato-api PoD ----------------
kubectl delete -f api-deployment.yml

echo ---------------- Deleting sirato-ingestion PoD ----------------
kubectl delete -f ingestion-deployment.yml

echo ---------------- Deleting vmbc-epirus Namespace ----------------
kubectl delete namespace vmbc-epirus

echo ---------------- Removing tmp files ----------------
rm -rvf epirus-net-networkpolicy.yml mongodb-deployment.yml web-deployment.yml api-deployment.yml ingestion-deployment.yml

echo ========================== DONE ===========================
