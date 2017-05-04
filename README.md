# Dockerfile for mariadb

Package provides the dockerfile which setup and run the mariadb on centos VM with configuration overwrite and database setup

# Features

* The docker image is built from centos/systemd 
* Allow user to create a database in the mariadb if the database is not created when docker container is started
* Allow user to configure the password for the 'root' account of mariadb
* Allow user to user to ssh into the container to start or stop the mariadb if needed
* Allow user to configure the mariadb such as default encoding, maximum connections, max packat allowed

# Usage

Git clone the project to your local computer:

```bash
git clone https://github.com/chen0040/dockerfile-centos-mariadb.git
```

## Build the mariadb docker image

Run the following command from the root folder of the project to build your own docker image:

```bash
docker build -t xschen/mariadb .
```

You can optionally save the image by running the following command:

```bash
docker save -o xschen-mariadb.img xschen/mariadb
```








