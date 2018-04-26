FROM rabbitmq:3.6.15-management

COPY wait-for-consul-and-start.sh wait-for-consul-and-start.sh

# Based on tutorial http://www.kuznero.com/posts/docker/rabbitmq-dynamic-cluster.html
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y wget curl && \
# The plugin only works on 3.6.x, they said 3.7.x will be a total different secnario to make RabbitMQ auto cluster.
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.10.0/autocluster-0.10.0.ez -P /usr/lib/rabbitmq/plugins && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.10.0/rabbitmq_aws-0.10.0.ez -P /usr/lib/rabbitmq/plugins && \
apt-get purge -y wget && \
apt-get autoremove && \
apt-get clean && \
# Enable auto cluster plugin
rabbitmq-plugins enable autocluster --offline && \
# Make sure docker-entrypoint.sh is executable, must use docker-entrypoint.sh to start service !!
# Official repository does not mantion anything about it.
chmod +x /usr/local/bin/docker-entrypoint.sh && \
chmod +x wait-for-consul-and-start.sh
# Override RabbitMQ ENTRYPOINT with default ENTRYPOINT value, we call docker-entrypoint.sh in our custom script.
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/wait-for-consul-and-start.sh"]
