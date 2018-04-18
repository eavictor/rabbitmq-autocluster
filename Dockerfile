FROM rabbitmq:3.6.15-management

# based on tutorial http://www.kuznero.com/posts/docker/rabbitmq-dynamic-cluster.html
RUN  apt-get update -y && apt-get install -y wget && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.10.0/autocluster-0.10.0.ez -P /usr/lib/rabbitmq/plugins && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.10.0/rabbitmq_aws-0.10.0.ez -P /usr/lib/rabbitmq/plugins && \
apt-get purge -y wget && apt-get clean

RUN rabbitmq-plugins enable autocluster --offline