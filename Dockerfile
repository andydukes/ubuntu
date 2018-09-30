# Based on Dockerfile by Tom Offerman
# Dockerfile for Squid3, with SSL enabled
# http://www.squid-cache.org/

FROM ubuntu:bionic
MAINTAINER Andy Dukes <andy@dukes.me.uk>

RUN echo "deb http://archive.ubuntu.com/ubuntu bionic main" > /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ bionic main restricted" > /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main restricted" > /etc/apt/sources.list

## Major bug fix updates produced after the final release of the
## distribution.
RUN echo "deb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted" > /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted" > /etc/apt/sources.list

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic universe" > /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ bionic universe" > /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-updates universe" > /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ bionic-updates universe" > /etc/apt/sources.list

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu 
## team, and may not be under a free licence. Please satisfy yourself as to 
## your rights to use the software. Also, please note that software in 
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic multiverse" > /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ bionic multiverse" > /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-updates multiverse" > /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ bionic-updates multiverse" > /etc/apt/sources.list
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe" > /etc/apt/sources.list

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
RUN echo "deb http://archive.canonical.com/ubuntu bionic partner" > /etc/apt/sources.list
RUN echo "deb-src http://archive.canonical.com/ubuntu bionic partner" > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main restricted" > /etc/apt/sources.list
RUN echo "deb-src http://security.ubuntu.com/ubuntu bionic-security main restricted" > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security universe" > /etc/apt/sources.list
RUN echo "deb-src http://security.ubuntu.com/ubuntu bionic-security universe" > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security multiverse" > /etc/apt/sources.list
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" > /etc/apt/sources.list
RUN echo "deb-src [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" > /etc/apt/sources.list
RUN echo "deb-src http://security.ubuntu.com/ubuntu bionic-security multiverse" > /etc/apt/sources.list

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
