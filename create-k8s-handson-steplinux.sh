#!/bin/bash
gcloud compute instances create "steplinux" \
 --image-family "ubuntu-1804-lts" \
 --image-project "ubuntu-os-cloud" \
 --boot-disk-size "30" \
 --custom-cpu "1" \
 --custom-memory "2048MB" \
 --network "k8s-handson" \
 --subnet "k8s-handson-subnet" \
 --tags "k8s-handson-steplinux" \
 --zone asia-northeast1-b \
 --preemptible
