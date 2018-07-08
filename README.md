This is only an example how to install [ChemAxon JChem PostgreSQL Cartride](https://chemaxon.com/products/jchem-engines) into vagrant. We don't suggest to use this exact image in production but it can provide an example to start building your own image.

# 1. Prerequisets

* vagrant installed
* Copy the latest JPC (JPC 4.0: https://chemaxon.com/download?dl=%2Fdata%2Fdownload%2Fjpc%2F4.0%2Fjchem-psql_4.0.r20180510.134745_amd64.deb ) next to Vagrantfile with the name: __jpc.deb__
* Copy a ChemAxon PSQL license next to Vagrantfile with name: __license.cxl__
    
After settings you should have the following files in the directory:
```
Vagrantfile
install.sh
jpc.deb
license.cxl
LICENSE.txt
postges-init.sh
README.md
```
    
# 2. Building and start the image:

* Run: `vagrant up`
    
This will build an image. This image is based on Ubuntu 18.04 LTS (Bionic Beaver) and uses OpenJDK 8 (1.8.0_171) to run JPC.
You can connect to the database as:
* USER: __postgres__
* PASSWORD: __postgres__
    
# 3. Log in to virtual machine

* Run `vagrant ssh`
    
This will log you in to the virtual machine. 
    
You can connect to the database with the following steps:
* change to postgres user: `su postgres -`
* connect to databse: `psql`
* and you can start running JPC related queries like: `SELECT TRUE AS IS_SUBSTRUCTURE WHERE 'C'::molecule('sample')|<|'CC';`
