#!/bin/bash
gcloud compute networks create k8s-handson \
 --subnet-mode=custom

sleep 60

gcloud compute networks list |grep k8s

gcloud compute networks subnets create k8s-handson-subnet \
 --network=kubernetes-handson \
 --range=192.168.0.0/24 \
 --region=asia-northeast1

sleep 60

gcloud compute networks subnets list |grep k8s

gcloud compute firewall-rules create allow-ssh-steplinux \
 --network k8s-handson \
 --direction ingress \
 --action allow \
 --target-tags k8s-handson-steplinux \
 --rules tcp:22

sleep 60

gcloud compute firewall-rules list |grep k8s
