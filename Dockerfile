FROM redhat/ubi8:8.10

# Install required packages and update system
RUN yum install -y git wget python3 sshpass && \
    yum update -y && \
    pip3 install --upgrade pip && \
    pip3 install ansible

# Set environment variable to change Ansible's temporary directory to /tmp
ENV ANSIBLE_LOCAL_TEMP=/tmp/.ansible/tmp
ENV HOME=/tmp

# Create the new temporary directory for Ansible under /tmp
RUN mkdir -p /tmp/.ansible/tmp && \
    chmod -R 777 /tmp/.ansible

# Set the working directory to /tmp
WORKDIR /tmp

# Create a non-root user and switch to that user
RUN useradd -m ansibleuser
USER ansibleuser

# Set environment variables for Ansible to work with the non-root user
ENV ANSIBLE_CONFIG=$HOME/.ansible.cfg
