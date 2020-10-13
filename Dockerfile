# Build a basic Ubuntu image with Python3.8 installed.
FROM ubuntu:latest

# Install key packages (Python should already be installed, but let's just make sure).
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    software-properties-common python3 python3-pip

# Install Maria DB and set root password to 'password'.
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password password password'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mariadb-server-10.3 mysql-server/root_password_again password password'"]
RUN apt-get -y install mariadb-server-10.3

# Make a directory to put the app code in (to be loaded in the docker-compose file)
RUN mkdir /app

# Copy the provision script and templates across to the container.
RUN mkdir /provision
COPY templates/ /provision/templates/
COPY provision.sh /provision/init.sh