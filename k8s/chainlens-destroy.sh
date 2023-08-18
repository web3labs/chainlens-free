#!/usr/bin/env bash
set -eu

kubectl delete --all deployments -n chainlens-explorer
kubectl delete --all services -n chainlens-explorer
kubectl delete namespace chainlens-explorer
