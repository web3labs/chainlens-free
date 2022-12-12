#!/usr/bin/env bash
set -eu

kubectl delete --all deployments -n sirato-explorer
kubectl delete --all services -n sirato-explorer
kubectl delete namespace sirato-explorer
