#!/usr/bin/env bash

# create overlay network for RabbitMQ cluster
sudo docker network create rabbit-net -d overlay

# create consul discovery service
sudo docker service create \
--name consul \
--network rabbit-net \
-p 8500:8500 \
-e 'CONSUL_BIND_INTERFACE=eth0' \
-e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' \
consul:latest \
agent \
-server -ui -client=0.0.0.0 \
-bootstrap-expect=1 \
-retry-join=consul

# create RabbitMQ service
sudo docker service create \
--name rabbit \
--network rabbit-net \
-p 5672:5672 \
-p 15672:15672 \
-e "AUTOCLUSTER_TYPE=consul" \
-e "CONSUL_HOST=consul" \
-e "CONSUL_PORT=8500" \
-e "CONSUL_SVC=rabbitmq" \
-e "CONSUL_SVC_ADDR_AUTO=true" \
-e "AUTOCLUSTER_CLEANUP=true" \
-e "CLEANUP_WARN_ONLY=false" \
-e "RABBITMQ_ERLANG_COOKIE=secrect" \
-e "RABBITMQ_DEFAULT_USER=eavictor" \
-e "RABBITMQ_DEFAULT_PASS=mypasswd" \
eavictor/rabbitmq-autocluster:3.6.15-management

# scale the instance
sudo docker service scale rabbit=3  # change the number if you want more instances
