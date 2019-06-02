FROM rabbitmq:3.7.15-management

ADD config/ /etc/rabbitmq/

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/wait-for-consul-and-start.sh"]