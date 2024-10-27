FROM redhat/ubi8:8.10

# Install required packages and update system
RUN yum install -y git wget python3 && \
    yum update -y && \
    pip3 install --upgrade pip && \
    pip3 install ansible
    
WORKDIR /root
