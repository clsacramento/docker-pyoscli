#!/bin/bash
set -e
if [ -z "$RC" ] 
then
	RC=/openrc
fi
source $RC
openstack
