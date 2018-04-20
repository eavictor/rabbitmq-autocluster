FROM rabbitmq:3.6.15-management

COPY wait-for-consul-and-start.sh wait-for-consul-and-start.sh

# based on tutorial http://www.kuznero.com/posts/docker/rabbitmq-dynamic-cluster.html
RUN  apt-get update && \
apt-get upgrade -y && \
apt-get install -y wget curl && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.10.0/autocluster-0.10.0.ez -P /usr/lib/rabbitmq/plugins && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.10.0/rabbitmq_aws-0.10.0.ez -P /usr/lib/rabbitmq/plugins && \
apt-get purge -y wget && \
apt-get autoremove && \
apt-get clean && \

rabbitmq-plugins enable autocluster --offline

chmod +x wait-for-consul-and-start.sh
CMD ["./wait-for-consul-and-start.sh"]
