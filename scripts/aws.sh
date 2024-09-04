#!/bin/bash -e
################################################################################
##  File:  aws.sh
##  Desc:  Installs the AWS CLI
################################################################################

# Install aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
