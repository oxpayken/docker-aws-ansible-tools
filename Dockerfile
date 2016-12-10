FROM mcpayment/docker-python

# Add wget, git
# Add devops user for automation execution
RUN apt-get update && \
    apt-get install --no-install-recommends -y  \
            openssh-client \
            libssl-dev \
            libffi-dev \
            groff \
            less \
            jq \
            wget \
            git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    adduser --disabled-login --gecos GECOS devops
WORKDIR /home/devops
USER devops

# Install awscli, ansible using virtualenv under devops user
RUN mkdir .aws data && \
    python -m virtualenv venv && \
    ./venv/bin/pip install awscli && \
    ./venv/bin/pip install boto && \
    ./venv/bin/pip install markupsafe && \
    ./venv/bin/pip install "pywinrm>=0.1.1" && \
    ./venv/bin/pip install ansible && \
    echo 'source ~/venv/bin/activate' >> .bashrc && \
    echo 'complete -C aws_completer aws' >> .bashrc && \
    rm -rf ~/.pip/cache/
