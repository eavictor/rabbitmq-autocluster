FROM rabbitmq:3.8.2-management

ADD config/enabled_plugins /etc/rabbitmq/enabled_plugins
ADD config/rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
ADD wait-for-consul-and-start.sh /wait-for-consul-and-start.sh

RUN apt-get update && apt-get install -y curl

# Overwirte default ENTRYPOINT, manually call docker-entrypoint.sh via custom script for service check
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/wait-for-consul-and-start.sh"]