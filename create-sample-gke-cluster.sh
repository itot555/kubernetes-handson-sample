#!/bin/bash
gcloud container clusters create sample-k8s-cluster \
 --image-type ubuntu \
 --cluster-version 1.13.6-gke.13 \
 --machine-type g1-small \
 --zone asia-northeast1-b \
 --preemptible \
 --num-nodes 3
