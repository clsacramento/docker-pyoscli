FROM python:3

RUN pip install python-openstackclient

ADD source_exec.sh /source_exec.sh
RUN chmod +x /source_exec.sh

ENV RC cliconfig/openrc

CMD ["/source_exec.sh"]
