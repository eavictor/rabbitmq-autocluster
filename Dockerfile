FROM rabbitmq:3.7.15-management

ADD config/ /etc/rabbitmq/
ADD wait-for-consul-and-start.sh /wait-for-consul-and-start.sh

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/wait-for-consul-and-start.sh"]