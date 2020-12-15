#!/bin/bash

AWS_REGIONS=(
    ap-northeast-1
    ap-northeast-2
    ap-south-1
    ap-southeast-1
    ap-southeast-2
    ca-central-1
    eu-central-1
    eu-west-1
    eu-west-2
    sa-east-1
    us-east-1
    us-east-2
    us-west-1
    us-west-2
)

for reg in ${AWS_REGIONS[@]}
do
    echo "Import key for" $reg
    aws ec2 delete-key-pair --key-name hydrand --region $reg
    aws ec2 import-key-pair --key-name hydrand --public-key-material file://~/.ssh/hydrand.pub --region $reg
done


