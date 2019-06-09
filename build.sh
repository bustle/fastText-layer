#!/bin/sh

COMMIT_SHA=d0b9ad2

docker build --build-arg COMMIT_SHA -t fasttext-layer .
docker run --rm fasttext-layer cat /tmp/fastText.zip > layer.zip
