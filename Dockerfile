FROM docker.io/redhat/ubi8:8.10

# Create local bin directory
RUN mkdir -p /root/.local/bin

# Add local bin to PATH environment
ENV PATH="/root/.local/bin:$PATH"

# Install required packages and clean up to reduce image size
RUN yum install -y \
        git \
        python3-pip \
    && yum clean all

# Download hadolint and install ansible, ansible-lint, and yamllint
RUN curl -o /root/.local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
    && chmod 0750 /root/.local/bin/hadolint \
    && python3 -m pip install --no-cache-dir --user \
        ansible==10.1.0 \
        ansible-lint==24.6.1 \
        yamllint==1.35.1 \
    && chmod -R 0750 /root/.local/bin \
    && ansible --version && ansible-lint --version && hadolint --version && yamllint --version
