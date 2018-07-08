#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
if [ ! -f /provisioned ]
then
	echo "export DEBIAN_FRONTEND=noninteractive">>/etc/environment
	apt-get update
	apt-get install -y gnupg software-properties-common postgresql postgresql-client postgresql-contrib openjdk-8-jdk
	dpkg -i /vagrant/jpc.deb
	cp /vagrant/license.cxl /etc/chemaxon/license.cxl
	chmod 666 /etc/chemaxon/license.cxl
	sudo su root -c '/etc/init.d/postgresql start'
	sudo /etc/init.d/jchem-psql init
	sudo /etc/init.d/jchem-psql start
	chmod +x /vagrant/postgres-init.sh
	su postgres -c '/vagrant/postgres-init.sh'
	sudo update-rc.d postgresql defaults
	sudo update-rc.d postgresql enable
	sudo update-rc.d jchem-psql defaults
	sudo update-rc.d jchem-psql enable
	echo date > /provisioned
else
	sudo /etc/init.d/jchem-psql start
	sudo /etc/init.d/jchem-psql start
fi
