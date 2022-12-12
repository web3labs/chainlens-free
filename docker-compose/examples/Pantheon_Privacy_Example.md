

### Connecting Sirato to Pantheon-quickstart privacy node

Get Pantheon Quickstart

```
git clone https://github.com/PegaSysEng/pantheon-quickstart.git
cd pantheon-quickstart
cd privacy
./run.sh
```

You should see the following happening in the terminal window.

![image](images/PantheonRun.png)



#### Set up Sirato-Free

```
git clone https://github.com/web3labs/sirato-free.git
cd sirato-free
```

In order to start sirato you need to run the following command:

`NODE_ENDPOINT=http://privacy_node1_1:8545 docker-compose -f docker-compose.yml -f sirato-extensions/docker-compose-pantheon.yml up`

The command above does two things :
* It sets up the node endpoint 
* Tells docker to run by using the two docker compose files provided.

The first docker-compose file in the command is the contains all the services required for sirato.

The second file named docker-compose-pantheon contains the network settings required to start sirato on the same network as pantheon.


> Note: we are connecting to node 1 - you will only see private transactions for that node.

You should see the following happening in the terminal window. This means that everything has started successfully.

![img](images/SiratoPantheon.png)

> Note: The logs are verbose and you will see various errors before all services are started. The important logs to look at are on the api. You can access them with the following
> 
>`docker-compose logs -f api`


Navigate to [localhost](http://localhost) and you should see the loading page:

![image](images/Loading.png)

After a few minutes Sirato should display the following information:

![img](../images/Blocks.png)

Sirato has successfully connected to a Pantheon node and is ingesting data. Depending on your machine specs this can take a long time to get to this point (20 mins on a macbook air).

To close Sirato you can execute the following line in your terminal:

`docker-compose down` 

To close Pantheon you can execute the following line in your terminal:
```
./stop.sh
./remove.sh
```



#### Help & Additional Information

For more information on Sirato you can go [here](https://github.com/web3labs/sirato-free).

For more information Pantheon-quickstart example you can go [here](https://github.com/PegaSysEng/pantheon-quickstart).

