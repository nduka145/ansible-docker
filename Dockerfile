FROM docker.io/redhat/ubi8:8.10

# Create necessary directory for local bin
RUN mkdir -p /root/.local/bin
ENV PATH="/root/.local/bin:$PATH"

# Install Git and Python, and clean up after installation
RUN yum install -y \
        git-2.43.5 \
        python3.12-pip-23.2.1 \
    && yum clean all

# Download hadolint and set permissions
RUN curl -o /root/.local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
    && chmod 0750 /root/.local/bin/hadolint

# Install ansible and other tools using pip, and ensure correct permissions
RUN python3 -m pip install --no-cache-dir --user \
        ansible==10.1.0 \
        ansible-lint==24.6.1 \
        yamllint==1.35.1 \
    && chmod 0755 /root/.local/bin/ansible-playbook \
    && chmod -R 0750 /root/.local/bin

# Verify installations and set path to ansible-playbook
RUN ansible --version && ansible-lint --version && hadolint --version && yamllint --version \
    && echo "Ansible playbook path: $(which ansible-playbook)"
