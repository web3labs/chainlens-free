# Kubernetes deployment scripts

You can use the script contained in this directory to generate and run Sirato using Kubernetes.

## Starting Sirato

If you are running locally, you should first start minikube, then run the following script:

```
./sirato-launch.sh http://<rpc-endpoint-ip>:<rpc-endpoint-port-number> 
```

Note: Port number is 8545 by default

You can verify the status of Sirato by running:

```
kubectl get pods
```

Once all pods are available, proceed to the next step.

## Start Proxy (If running local minikube)

Ensure minikube ingress is enabled, issuing the following command

```
minikube addons enable ingress
```

Start proxy service, issuing the following command

```
minikube service sirato-proxy
```

```
❯ minikube service sirato-proxy
|-----------|--------------|-------------|---------------------------|
| NAMESPACE |     NAME     | TARGET PORT |            URL            |
|-----------|--------------|-------------|---------------------------|
| default   | sirato-proxy |          80 | http://192.168.49.2:31969 |
|-----------|--------------|-------------|---------------------------|
🏃  Starting tunnel for service sirato-proxy.
|-----------|--------------|-------------|------------------------|
| NAMESPACE |     NAME     | TARGET PORT |          URL           |
|-----------|--------------|-------------|------------------------|
| default   | sirato-proxy |             | http://127.0.0.1:56439 |
|-----------|--------------|-------------|------------------------|
🎉  Opening service default/sirato-proxy in default browser...
```

Point your browser to the provided URL.

## Stopping Sirato

To stop Sirato and cleanup all components, run:

```
./sirato-destroy.sh
```
