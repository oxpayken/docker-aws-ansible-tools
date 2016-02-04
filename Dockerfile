FROM mcpayment/python

# Add a devops user for automation execution
RUN adduser --disabled-login --gecos GECOS devops
WORKDIR /home/devops
USER devops

# Install awscli, ansible using virtualenv under devops user
RUN virtualenv venv && \
    ./venv/bin/pip install awscli && \
    ./venv/bin/pip install markupsafe && \
    ./venv/bin/pip install ansible && \
    echo 'source ~/venv/bin/activate' >> .bashrc && \
    echo 'complete -C aws_completer aws' >> .bashrc && \
    rm -rf ~/.pip/cache/

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
