#!/bin/bash
gcloud compute networks create k8s-handson \
 --subnet-mode=custom

sleep 10

gcloud compute networks list |grep k8s

gcloud compute networks subnets create k8s-handson-subnet \
 --network=k8s-handson \
 --range=192.168.0.0/24 \
 --region=asia-northeast1

sleep 10

gcloud compute networks subnets list |grep k8s

gcloud compute firewall-rules create allow-ssh-steplinux \
 --network k8s-handson \
 --direction ingress \
 --action allow \
 --target-tags k8s-handson-steplinux \
 --rules tcp:22

gcloud compute firewall-rules create allow-concourse-web \
 --network k8s-handson \
 --direction ingress \
 --action allow \
 --target-tags k8s-handson-steplinux \
 --rules tcp:8080

sleep 10

gcloud compute firewall-rules list |grep k8s
