

### Connecting Epirus to Quorum 7 Node Example 

##### Requirements 

1. Docker Compose


Get Epirus 

>git clone https://github.com/blk-io/epirus-free.git


Get Quorum 7 node example 

> git clone https://github.com/jpmorganchase/quorum-examples


#### Starting the services 

- Quorum 7 Node Example

Open the terminal and navigate to the directory where Quorum was cloned. Once you are in the same directory as the docker-compose file execute the following line in your terminal:

`docker-compose up -d`

You should see the following happening in the terminal window.

![image](images/7NodesDocker.png)

Open the terminal and navigate to the directory where Epirus was cloned. Once you are in the same directory as the docker-compose file execute the following line in your terminal:

`NODE_ENDPOINT=http://172.16.239.11:8545/ docker-compose up -d`

You should see the following happening in the terminal window. This means that everything has started successfully.


![img](images/EpirusDocker.png)

> Note: If you want to check the progress in more detail you can execute the following line in your terminal after the docker setup: 
> 
>`docker-compose logs -f api`


Navigate to [localhost](http://localhost) and you should see the following:

![image](images/Loading.png)

After a few minutes Epirus should display the following information:

![img](../images/Blocks.png)

Epirus has successfully connected to the Quorum Blockchain.

To close Epirus or Quorum you can execute the following line in your terminal:

`docker-compose down` 

Make sure you are in the same directory as the compose file.

#### Help & Additional Information

For more information on Epirus you can go [here](https://github.com/blk-io/epirus-free).

For more information Quorum 7 Nodes example you can go [here](https://github.com/jpmorganchase/quorum-examples/blob/master/README.md).

