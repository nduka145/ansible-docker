FROM docker.io/redhat/ubi8:8.10

RUN mkdir -p /root
ENV PATH "/root:$PATH"

RUN yum install -y \
        git \
        python3.12-pip-23.2.1 \
    && yum clean all

# Download and install Hadolint, then install Ansible, Ansible-lint, and Yamllint
RUN curl -o /root/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
    && chmod 0750 /root/hadolint \
    && python3 -m pip install --no-cache-dir --user \
        ansible \
        ansible-lint \
        yamllint
