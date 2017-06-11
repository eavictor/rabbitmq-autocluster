### Based on this tutorial:

http://www.kuznero.com/posts/docker/rabbitmq-dynamic-cluster.html

### How to build  image ??
```docker build -t <yourname>/rabbitmq-autocluster:latest .```

### how to deploy ??

see init_cluster.sh for ugly script.

docker-compose.yml for docker stack deploy is not tested.

```docker stack deploy --compose-file docker-compose.yml```

### If you found RabbitMQ cluster is splitted

1. ```docker service scale rabbit=0```
2. increase the number slowly, +1 everytime