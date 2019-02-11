#!/bin/sh

COMMIT_SHA=c4542e5

docker build --build-arg COMMIT_SHA -t fasttext-layer .
docker run --rm fasttext-layer cat /tmp/fastText.zip > layer.zip
