# Docker AWS Ansible 

Create a base  AWS + Ansible image.

FROM [mcpayment/docker-python](https://github.com/mcpayment/docker-python)

To build:

`docker build -t docker-aws-ansible - < Dockerfile`

To run:

`docker run -it --name=docker-aws-ansible -v <.aws path>:/home/devops/.aws -v <data path>:/home/devops/data mcpayment/docker-aws-ansible`

- <.aws path> - .aws folder on your local, this folder contains AWS credentials
- \<data path\> - data folder on your local, this folder contains working files (AWS, Ansible scripts etc.)
