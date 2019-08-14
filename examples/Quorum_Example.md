

### Connecting Epirus to Quorum 7 Node Example 

Get Quorum 7 node example 

```
git clone https://github.com/jpmorganchase/quorum-examples
cd quorum-examples
docker-compose up

```

You should see the following happening in the terminal window.

![image](images/7NodesDocker.png)

#### Set up Epirus-Free

```
git clone https://github.com/blk-io/epirus-free.git
cd epirus-free
```

You need to make some minor changes to the `docker-compose.yml` file so that epirus can connect a running node.

Change the networks `name` property from `epirus` to `quorum-examples-net ` in the networks settings so it looks like this:

```json
networks:
  epirus:
    name: quorum-examples-net
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 172.16.239.0/24
```

Now you can start epirus with the following command. 

`NODE_ENDPOINT=http://172.16.239.11:8545/ docker-compose up`

> Note: we are connecting to node 1 - you will only see private transactions for that node.

You should see the following happening in the terminal window. This means that everything has started successfully.

![img](images/EpirusDocker.png)

> Note: The logs are verbose and you will see various errors before all services are started. The important logs to look at are on the api. You can access them with the following
> 
>`docker-compose logs -f api`


Navigate to [localhost](http://localhost) and you should see the loading page:

![image](images/Loading.png)

After a few minutes Epirus should display the following information:

![img](../images/Blocks.png)

Epirus has successfully connected to a Quorum node and is ingesting data.

To close Epirus or Quorum you can execute the following line in your terminal:

`docker-compose down` 


#### Help & Additional Information

For more information on Epirus you can go [here](https://github.com/blk-io/epirus-free).

For more information Quorum 7 Nodes example you can go [here](https://github.com/jpmorganchase/quorum-examples/blob/master/README.md).

