# Ansible Control Node
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3-pip sshpass openssh-client vim && \
    pip3 install ansible && \
    apt-get clean

WORKDIR /ansible

