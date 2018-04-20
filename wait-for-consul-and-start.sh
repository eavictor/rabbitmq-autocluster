#!/bin/bash

CONSUL_HOST=consul

# 1. Check consul service
until curl get http://$CONSUL_HOST:8500/v1/agent/services ; do
    >&2 echo "Consul service not available"
    sleep 1
done
>&2 echo "Consul service is up !!"

# 2. Start RabbitMQ service
rabbitmq-server
