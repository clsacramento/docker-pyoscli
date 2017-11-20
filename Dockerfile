FROM python:3

ENV http_proxy http://16.46.41.11:8080
ENV https_proxy http://16.46.41.11:8080

RUN env
RUN apt update
#useful to have an editor when running on interactive mode
RUN apt install vim -y

RUN pip install --upgrade pip
RUN pip install python-openstackclient==3.8.1
#have to install neutron client because not all neutron commands are available on openstack CLI
RUN pip install python-neutronclient -U
RUN pip install python-heatclient -U

RUN openstack complete | tee /etc/bash_completion.d/openstack

ADD source_exec.sh /source_exec.sh
RUN chmod +x /source_exec.sh

ENV RC cliconfig/openrc

ENV http_proxy ""
ENV https_proxy ""

CMD ["/source_exec.sh"]
