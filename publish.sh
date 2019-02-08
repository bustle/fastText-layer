#!/bin/bash

LAYER_NAME=fastText

COMMIT_SHA=c4542e5

REGIONS='
ap-northeast-1
ap-northeast-2
ap-south-1
ap-southeast-1
ap-southeast-2
ca-central-1
eu-central-1
eu-north-1
eu-west-1
eu-west-2
eu-west-3
sa-east-1
us-east-1
us-east-2
us-west-1
us-west-2
'

for region in $REGIONS; do
  aws lambda add-layer-version-permission --region $region --layer-name $LAYER_NAME \
    --statement-id sid1 --action lambda:GetLayerVersion --principal '*' \
    --version-number $(aws lambda publish-layer-version --region $region --layer-name $LAYER_NAME \
      --zip-file fileb://layer.zip --cli-read-timeout 0 --cli-connect-timeout 0 \
      --description "fastText from github.com/bustle/fastText/commit/${COMMIT_SHA}" --query Version --output text)
done
