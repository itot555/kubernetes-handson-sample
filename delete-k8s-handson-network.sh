#!/bin/bash
gcloud compute firewall-rules delete allow-ssh-steplinux
gcloud compute networks subnets delete k8s-handson-subnet
gcloud compute networks delete k8s-handson
