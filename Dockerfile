FROM docker.io/redhat/ubi8:8.10

RUN mkdir -p /root/.local/bin
ENV PATH "/root/.local/bin:$PATH"

RUN yum install -y \
        git \
        python3.12-pip-23.2.1 \
    && yum clean all

# Download and install Hadolint, then install Ansible, Ansible-lint, and Yamllint
RUN curl -o /root/.local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
    && chmod 0750 /root/.local/bin/hadolint \
    && python3 -m pip install --no-cache-dir --user \
        ansible==10.1.0 \
        ansible-lint==24.6.1 \
        yamllint==1.35.1 \
    && chmod +x /root/.local/bin/ansible-playbook \
    && ansible --version && ansible-lint --version && hadolint --version && yamllint --version
