# Docker AWS Ansible 

Create a base  AWS + Ansible image.

FROM [mcpayment/docker-python](https://github.com/mcpayment/docker-python)

To build:

`docker build -t docker-aws-ansible - < Dockerfile`

To run:

`docker run -it --name=docker-aws-ansible -v <.aws path>:/home/devops/.aws -v <.ssh path>:/home/devops/.ssh -v <data path>:/home/devops/data mcpayment/docker-aws-ansible`

- <.aws path> - .aws folder on your local, this folder contains AWS credentials
- <.ssh path> - .ssh folder on your local, this folder contains ssh credentials
- \<data path\> - data folder on your local, this folder contains working files (AWS, Ansible scripts etc.)

---

To fix/find out:

- files in mounted folder have different permission
- use virtualenv from mounted data folder


## Prerequisites 

- local folder .aws, .ssh, data to be mounted in container should be present or created

