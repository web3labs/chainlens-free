# Blockchain Explorer for Quorum and Ethereum

![alt text](https://raw.githubusercontent.com/blk-io/epirus-free/master/images/Contracts.png "Epirus Free")

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

* http://localhost/

To stop the containers use:

```bash
docker-compose down
```

To connect to new network you should remove the volumes associated with the old network

```bash
docker-compose down -v
```

## Tokens and contract metadata

![Tokens screen](https://raw.githubusercontent.com/blk-io/epirus-free/master/images/Tokens.png)

This is a free version of our Epirus Blockchain Explorer. For additional features such as full tokens support, 
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

For further information visit our [website](https://www.web3labs.com) or email <hi@web3labs.com>.

## Limitations

 - Due to a [limitation](https://github.com/moby/moby/issues/1143) with Docker, you may only have one instance of the Explorer running at a time.
