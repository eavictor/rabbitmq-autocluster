# Based on this tutorial

https://medium.com/hepsiburadatech/implementing-highly-available-rabbitmq-cluster-on-docker-swarm-using-consul-based-discovery-45c4e7919634

## How to build  image ??
```docker build -t <yourname>/rabbitmq-autocluster:latest```

## how to deploy ??

```docker stack deploy --compose-file docker-compose.yml```

## Why I cannot create consul cluster ??

The trick is use ```tasks.consul``` instead of ```consul```, which will list all consul containers' IP address.

## If you found RabbitMQ cluster is splitted

1. ```docker service scale rabbit=0```
2. increase the number slowly, +1 everytime