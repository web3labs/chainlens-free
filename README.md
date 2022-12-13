# Sirato

Blockchain Explorer for Besu, Quorum, VMWare Blockchain and Ethereum compatible blockchains

![Sirato Dashboard](https://raw.githubusercontent.com/web3labs/sirato-free/master/images/sirato-dashboard.png "Sirato dashboard")

## Introduction

Sirato is a data and analytics platform for Ethereum compatible blockchains.

It provides a rich API, and easy to use interface to provide information on the various assets such as tokens, and smart contracts deployed on blockchains.

A free developer edition is available in this repo, we also provide hosted plans for it. They are outlined below.

## Free plan

This distribution of Sirato is a free version designed for viewing public and private Ethereum networks. It supports  
[Quorum](https://github.com/ConsenSys/quorum), [Hyperledger Besu](https://besu.hyperledger.org/en/stable/), [VMWare Blockchain for Ethereum](https://www.vmware.com/products/blockchain.html) and [Ethereum](https://github.com/ethereum/go-ethereum) networks.

![Sirato Free Screenshot](https://raw.githubusercontent.com/web3labs/sirato-free/master/images/sirato-free.png "Sirato free")

## Hosted plans

Web3 Labs provides hosted plans that provides additional functionality including:

- Custom branding and hosting at a custom domain
- Dedicated views of tokens
- Smart contract management and source code upload
- OpenAPI back-end
- Integrations with business intelligence tools such as Tableau Microsoft PowerBI and Qlik
- Production SLAs
- Large transaction volumes (100,000,000+)

![Sirato Hosted Screenshot](https://raw.githubusercontent.com/web3labs/sirato-free/master/images/sirato-hosted.png "Sirato customer instance Palm with verified source code")

The advantage of the hosted plan is that all you need to provide is a compatible web3 client endpoint and we will do the rest.

You can view more information on these plans [here](https://www.web3labs.com/blockchain-explorer-sirato-plans), or contact Web3 Labs directly via [hi@web3labs.com](mailto:hi@web3labs.com?subject=Sirato%20hosted%20plans).

### Deployment instructions

This repo contains configuration to run the free version using either Docker Compose or Kubernetes.

Follow the appropriate guide to run Sirato locally against an Ethereum, Quorum, Hyperledger Besu, or VMBC compatible network.

- [Docker Compose deployment](docker-compose/README.md)
- [Kubernetes deployment](k8s/README.md)

## License

Sirato is free for non-commercial use and evaluation purposes only, for further details refer to the [LICENSE](LICENSE). To speak to use about commercial use you can email us via `hi <at> web3labs.com` or submit an enquiry [here](https://pages.web3labs.com/sirato-enterprise).
