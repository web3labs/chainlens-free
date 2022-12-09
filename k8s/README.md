# Kubernetes deployment scripts

You can use the script contained in this directory to generate and run Sirato using Kubernetes.

## Starting Sirato

If you are running locally, you should first start minikube, then run the following script:

```
./sirato-launch.sh <hostname>:<rpc-endpoint>
```

You can verify the status of Sirato by running:

```
kubectl get pods
```

Once all pods are available you should be able to access Sirato via http://localhost


## Stopping Sirato

To stop Sirato and cleanup all components, run:

```
./sirato-destroy.sh
```
