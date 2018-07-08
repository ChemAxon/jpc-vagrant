#!/bin/bash

# Copyright 2018 ChemAxon Ltd.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
