#!/bin/bash

# Modify consul host if you plain to use other name
CONSUL_HOST=consul


# 1. Check consul service
until curl get http://$CONSUL_HOST:8500/v1/agent/services ; do
    >&2 echo "[$date+'%Y/%m/%d %T'] Consul - Service for RabbitMQ auto cluster is unavailable, sleep 10 seconds."
    sleep 10
done
>&2 echo "[$date+'%Y/%m/%d %T'] Consul - Service for RabbitMQ auto cluster is available, start RabbitMQ Server."


# 2. Start RabbitMQ service
rabbitmq-server
