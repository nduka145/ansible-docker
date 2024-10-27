FROM redhat/ubi8:8.10

# Install required packages and update system
RUN yum install -y git wget python3 && \
    yum update -y && \
    pip3 install --upgrade pip && \
    pip3 install ansible

# Set environment variable to change Ansible's temporary directory
ENV ANSIBLE_LOCAL_TEMP=/tmp/.ansible/tmp

# Create the new temporary directory for Ansible under /tmp
RUN mkdir -p /tmp/.ansible/tmp

# Ensure proper permissions are set for the /tmp directory and its subfolders
RUN chmod 1777 /tmp && chmod -R 700 /tmp/.ansible

# Set the working directory to /root
WORKDIR /root

# Run as root user
USER root
