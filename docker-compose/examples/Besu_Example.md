

#### Set up Sirato-Free

```
git clone https://github.com/web3labs/sirato-free.git
cd sirato-free
```

In order to start sirato you need to run the following command:

`NODE_ENDPOINT=http://besu-node:8545 docker-compose -f docker-compose.yml -f sirato-extensions/docker-compose-besu.yml up`

To run with [quorum-dev-quickstart](https://besu.hyperledger.org/en/stable/private-networks/tutorials/quickstart/#prerequisites) example run the following command:

`NODE_ENDPOINT=http://rpcnode:8545 docker-compose -f docker-compose.yml -f sirato-extensions/docker-compose-quorum-dev-quickstart.yml up`

The command above does two things :
* It sets up the node endpoint 
* Tells docker to run by using the two docker compose files provided.

The first docker-compose file in the command is the contains all the services required for sirato.

The second file named docker-compose-besu contains the network settings required to start sirato on the same network as Besu dev node.

> Note: TODO: add transaction examples

You should see the following happening in the terminal window. This means that everything has started successfully.

![img](images/SiratoDocker.png)

> Note: The logs are verbose and you will see various errors before all services are started. The important logs to look at are on the api. You can access them with the following
> 
>`docker-compose logs -f api`


Navigate to [localhost](http://localhost) and you should see the loading page:

![image](images/Loading.png)

After a few minutes Sirato should display the following information:

![img](../images/Blocks.png)

Sirato has successfully connected to a Besu node and is ingesting data. Depending on your machine specs this can take a long time to get to this point (20 mins on a macbook air).

To close Sirato or Besu you can execute the following line in your terminal:

`docker-compose down` 


#### Help & Additional Information

For more information on Sirato you can go [here](https://github.com/web3labs/sirato-free).

For more information Besu setup example you can go [here](https://besu.hyperledger.org/en/stable/private-networks/get-started/install/run-docker-image/).

