#!/bin/bash
TAG=$1

export CLOUDSDK_CORE_DISABLE_PROMPTS=1

if [ ! -d "${HOME}/google-cloud-sdk" ]; then
    curl https://sdk.cloud.google.com | bash
fi
gcloud config set project dominion-p2p
gcloud auth activate-service-account --key-file gcp-credentials.json

gcloud docker push "gcr.io/dominion-p2p/dominion:${TAG}"