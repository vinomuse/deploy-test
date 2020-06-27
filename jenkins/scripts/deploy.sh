#!/bin/bash

echo 'Start deploying'

set -x
cd /home
ls -al
# ssh -i "my_aws_key.pem" ubuntu@ec2-15-165-161-155.ap-northeast-2.compute.amazonaws.com
# ls -al
set +x

echo 'Deployed!'
