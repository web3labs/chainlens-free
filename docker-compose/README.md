## Usage

Clone the repo, navigate to the cloned directory and run the instance with:

```bash
cd docker-compose
docker-compose pull
NODE_ENDPOINT=http://<node_endpoint> docker-compose up
```
The explorer runs on port `80` by default, if you want to use a custom port e.g 26000, set the `PORT` environment variable and the explorer will be accessible via http://localhost:26000.

```bash
NODE_ENDPOINT=http://localhost:8585 PORT=26000 docker-compose up -d
```

Note that if setting `NODE_ENDPOINT` to a local Ethereum instance, you may need to use the IP address associated with the Docker bridged interface. 

On Linux, the bridged adapter should be 172.16.239.1, as denoted in docker-compose.yml. To connect to a local node, start with the command:

```bash
NODE_ENDPOINT=http://172.16.239.1:8545 docker-compose up
```

On MacOS and Windows, a platform sepcific command is required due to limitations around the Docker network stack on MacOS. This is as follows: 

```bash
NODE_ENDPOINT=http://host.docker.internal:8545 docker-compose up
```

Note that in both cases, your local instance of geth must be started with `--rpcaddr 0.0.0.0` and `--rpcvhosts="*"`, or Sirato will be unable to access it.

Also note that on Windows Chainlens may take a long time to come up (sometimes up to 20 minutes) due to Windows filesystem performance issues with Linux VMs.

Append the `-d` argument to run the containers in the backgroud

You will be able to access the Explorer UI via:

* http://localhost/

To stop the containers use:

```bash
docker-compose down
```

To connect to new network you should remove the volumes associated with the old network

```bash
docker-compose down -v
```

## Quorum & Hyperledger Besu 

To run the Quroum 7 node example with Chainlens free [follow these instructions](examples/Quorum_Example.md). 

To run the Pantheon-quickstart privacy network example [follow these instructions](examples/Pantheon_Privacy_Example.md).

## Limitations

 - Due to a [limitation](https://github.com/moby/moby/issues/1143) with Docker, you may only have one instance of the Explorer running at a time.

