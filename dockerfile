FROM ubuntu:latest

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    tree \
    sshpass \
    && apt clean

RUN python3 -m venv /opt/ansible-venv

RUN /opt/ansible-venv/bin/pip install --upgrade pip \
    && /opt/ansible-venv/bin/pip install ansible ansible-core paramiko netmiko requests

RUN /opt/ansible-venv/bin/ansible-galaxy collection install ansible.netcommon \
    cisco.ios \
    cisco.nxos \
    cisco.asa \
    cisco.catalystwan \
    cisco.ise \
    cisco.aci

ENV PATH="/opt/ansible-venv/bin:$PATH"

WORKDIR /ansible
