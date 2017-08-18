# Docker Python OpenStack Client

Easy access to OpenStack without having to install all the clients.


## How to use

Two ways:


- Run openstack interactive cli:
~~~
$ docker run -ti -v $PWD/example/:/cfg --env "RC=cfg/demo-openrc.sh" --rm clsacramento/pyoscli 
(openstack) image list
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 50000454-cda0-425f-8ee6-4e72807d4a98 | cirros-0.3.4-x86_64-uec         | active |
| b71c252b-491b-48ed-b5dd-713b51d7ab32 | cirros-0.3.4-x86_64-uec-ramdisk | active |
| 488e479e-1c31-439d-8aa0-6f9d64f710bc | cirros-0.3.4-x86_64-uec-kernel  | active |
+--------------------------------------+---------------------------------+--------+
(openstack) volume type list
+--------------------------------------+-------------+
| ID                                   | Name        |
+--------------------------------------+-------------+
| d8f28c7e-dcb0-4b9b-bc15-b138275221ac | lvmdriver-1 |
+--------------------------------------+-------------+
(openstack) 

~~~

- Or get a bash and execute openstack commands:
~~~
$ docker run -ti -v $PWD/example/:/cfg --env "RC=cfg/demo-openrc.sh" --rm clsacramento/pyoscli /bin/bash
root@b897b4f6fbd3:/# source $RC
root@b897b4f6fbd3:/# openstack image list
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 50000454-cda0-425f-8ee6-4e72807d4a98 | cirros-0.3.4-x86_64-uec         | active |
| b71c252b-491b-48ed-b5dd-713b51d7ab32 | cirros-0.3.4-x86_64-uec-ramdisk | active |
| 488e479e-1c31-439d-8aa0-6f9d64f710bc | cirros-0.3.4-x86_64-uec-kernel  | active |
+--------------------------------------+---------------------------------+--------+
~~~

## Docker run options

Volume is necessary to include your openstack RC file into the docker c ontainer. If not provided, you can still 'docker run' and execute the client by passing all the --os arguments, such as --os-tenant-name etc.

If the volume mounted on the container is on the path /cliconfig and your rc file is named 'openrc' the --env option can be discarded.

This container is not going to be doing any job after execution so '--rm' option from the example is recommended.

In order to execute commands of the openstack cli, the interactive option '--ti' is required. Alternatively you could pass a script to the container executing all openstack cli command desired. 
For example:
~~~
$ cat example/list_images.sh 
source $RC
openstack image list

docker run  -v $PWD/example/:/cfg --env "RC=cfg/demo-openrc.sh" --rm clsacramento/pyoscli /bin/bash /cfg/list_images.sh
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 50000454-cda0-425f-8ee6-4e72807d4a98 | cirros-0.3.4-x86_64-uec         | active |
| b71c252b-491b-48ed-b5dd-713b51d7ab32 | cirros-0.3.4-x86_64-uec-ramdisk | active |
| 488e479e-1c31-439d-8aa0-6f9d64f710bc | cirros-0.3.4-x86_64-uec-kernel  | active |
+--------------------------------------+---------------------------------+--------+
~~~
