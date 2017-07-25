FROM rabbitmq:management

# based on tutorial http://www.kuznero.com/posts/docker/rabbitmq-dynamic-cluster.html
RUN  apt-get update -y && apt-get install -y wget && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.8.0/autocluster-0.8.0.ez -P /usr/lib/rabbitmq/lib/rabbitmq_server-$RABBITMQ_VERSION/plugins/ && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.8.0-milestone2/autocluster_aws-0.0.1.ez -P /usr/lib/rabbitmq/lib/rabbitmq_server-$RABBITMQ_VERSION/plugins/ && \
wget https://github.com/rabbitmq/rabbitmq-autocluster/releases/download/0.8.0/rabbitmq_aws-0.8.0.ez -P /usr/lib/rabbitmq/lib/rabbitmq_server-$RABBITMQ_VERSION/plugins/ && \
apt-get purge -y wget && apt-get clean

RUN rabbitmq-plugins enable --offline autocluster