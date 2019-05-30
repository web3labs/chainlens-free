# Epirus - Quorum and Ethereum Smart Contract Registry
## Blockchain explorer for Ethereum based networks

![alt text](https://raw.githubusercontent.com/blk-io/epirus-free/master/docs/blocks.png "Epirus Free")


## Introduction

This dockerized environment is designed for viewing private 
[Quorum](https://github.com/jpmorganchase/quorum) and [Ethereum](https://github.com/ethereum/go-ethereum) networks.

## Usage

Clone the repo, navigate to the cloned directory and run the instance with:

```bash
NODE_ENDPOINT=http://<node_endpoint> docker-compose up
```
Append the `-d` argument to run the containers in the backgroud

You will be able to access the Explorer UI via:

* http://localhost:5000

To stop the containers use:

```bash
docker-compose down
```

To connect to new network you should remove the volumes associated with the old network

```bash
docker-compose down -v
```
 
### Local Quorum Networks

If you need to run a Quorum network locally, we recommend you use the following [4-node Quorum Docker image](https://github.com/blk-io/crux#4-node-quorum-network-with-crux), you can then start the Explorer via:

```bash
NODE_ENDPOINT=http://localhost:22001 docker-compose up
```

## Limitations

 - Due to a [limitation](https://github.com/moby/moby/issues/1143) with Docker, you may only have one instance of the Explorer running at a time.
