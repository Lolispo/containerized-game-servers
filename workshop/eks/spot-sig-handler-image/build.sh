#!/bin/bash


region=eu-west-1

source ../account.conf

repo='.dkr.ecr.'$region'.amazonaws.com/spot-sig-handler:latest'
repo_url=$account$repo

$(aws ecr get-login --no-include-email --region $region)
docker build -t spot-sig-handler .
docker tag spot-sig-handler:latest $repo_url
docker push $repo_url
