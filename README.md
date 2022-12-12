# Sirato

Blockchain Explorer for Besu, Quorum, VMBC and Ethereum

![alt text](https://raw.githubusercontent.com/blk-io/epirus-free/master/images/Contracts.png "Epirus Free")

## Introduction

This dockerized environment is designed for viewing public and private Ethereum networks. It supports  
[Quorum](https://github.com/ConsenSys/quorum), [Hyperledger Besu](https://besu.hyperledger.org/en/stable/) and [Ethereum](https://github.com/ethereum/go-ethereum) networks.

Instructions for Docker are below, instructions for Kubernetes are available [here](k8s/README.md).

## Usage

Clone the repo, navigate to the cloned directory and run the instance with:

```bash
docker-compose pull
NODE_ENDPOINT=http://<node_endpoint> docker-compose up
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

Note that in both cases, your local instance of geth must be started with `--rpcaddr 0.0.0.0` and `--rpcvhosts="*"`, or Epirus will be unable to access it.

Also note that on Windows Epirus may take a long time to come up (sometimes up to 20 minutes) due to Windows filesystem performance issues with Linux VMs.

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

## VMware Blockchain (VMBC)

Sirato supports [VMware Blockchain](https://vmware-samples.github.io/vmware-blockchain-samples/) platform. Follow this [guide](k8s/README.md) to start Sirato within VMWare Blockchain Kubernetes cluster,

## Quorum & Hyperledger Besu 

To run the Quroum 7 node example with epirus free [follow these instructions](examples/Quorum_Example.md). 


To run the Pantheon-quickstart privacy network example [follow these instructions](examples/Pantheon_Privacy_Example.md).


## Tokens and contract metadata

![Tokens screen](https://raw.githubusercontent.com/blk-io/epirus-free/master/images/Tokens.png)

This is a free version of our Sirato Blockchain Explorer. For additional features such as full tokens support, 
and contract metadata upload (so all transaction and events are decoded), please use our offering available on the 
[Azure Marketplace](https://web3labs.com/azure-offer).

![Azure offering](https://raw.githubusercontent.com/blk-io/epirus-free/master/images/Azure-offer.png)

We can also provide hosted Blockchain Explorer instances - these can be hosted within your cloud subscription or hosted by us.

Some of the features include:

- SSO authentication (Active Directory, SAML, Okta, etc)
- Dedicated database
- Data encryption at rest and in transit
- Continuous backup and point in time data recovery
- Full access to backups
- Tableau integration support 

For further information visit our [website](https://www.web3labs.com) or email <support@web3labs.com>.

## Limitations

 - Due to a [limitation](https://github.com/moby/moby/issues/1143) with Docker, you may only have one instance of the Explorer running at a time.

## License

Epirus is free for non-commercial use and evaluation purposes only, for further details refer to the [LICENSE](LICENSE). To speak to use about commercial use you can email us via `hi <at> web3labs.com` or submit an enquiry [here](https://pages.web3labs.com/epirus-enterprise).
