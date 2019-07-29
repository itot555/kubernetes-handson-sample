# kubernetes-handson-sample
kubernetes handson sample document

## Description

## Requirement
- WSL
- Visual Studio Code
- git
- Google Cloud SDK

## Preparation

## Usage

## Setup k8s-Handson-environment
- Set up GCP environment

  `$ ./create-k8s-handson-network.sh`
  
  `$ ./create-k8s-handson-steplinux.sh`
  
- Login to gcp instance

  `$ gcloud compute ssh ubuntu@steplinux`
  
  - set up gcloud SDK
  
    `$ gcloud auth login`
    
    `$ gcloud config list`
    
    `$ gcloud config set compute/zone asia-northeast1-b`
    
    `$ gcloud config set compute/region asia-northeast1`
    
- Create GKE Cluster
 
  `$ mkdir workspace`
   
  `$ cd workspace`
   
  `$ git clone https://github.com/itot555/kubernetes-handson-sample.git`
   
  `$ ./create-sample-gke-cluster.sh`
   
  `$ gcloud container clusters list`
   
- Set up kubectl

  `$ cd ~`
  
  `$ curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl`
  
  `$ chmod +x kubectl`
  
  `$ sudo mv kubectl /usr/local/bin/`
  
  `$ kubectl version`
  
  `$ gcloud container clusters get-credentials sample-k8s-cluster`
  
  `$ kubectl cluster-info`
  
  `$ kubectl get all --all-namespaces`

## k8s-Handson

- Deploy Pod

  `$ kubectl apply -f 01-pod.yml`
  
  - check pod status
    
    `$ kubectl describe pod spse-pod`
    
    `$ kubectl get pods -o wide`
    
  - access to pod
  
    `$ kubectl exec -it spse-pod /bin/bash`
    
    `$ kubectl exec -it spse-pod df`
    
    `$ kubectl exec -it spse-pod -- ls -la`
    
    `$ kubectl exec -it spse-pod -- sh -c "ls -la |grep tmp"`
    
- Delete pod

  `$ kubectl delete -f 01-pod.yml`
  
- Deploy ReplicaSet

  `$ kubectl apply -f 02-replicaset.yml`
  
  - check status
  
    `$ kubectl get pods`
    
    `$ kubectl get rs -o wide`
  
  - check pod self healing function
  
    `$ kubectl delete pod spse-rs-....`
    
    `$ kubectl get pod -o wide`
    
    `$ kubectl describe rs spse-rs`
 
 - Delete RelicaSet
 
   `$ kubectl delete -f 02-replicaset.yml`
   
- Deploy Deployment

  `$ kubectl apply -f 03-deployment.yml --record`
  
  - check status
  
    `$ kubectl get deployments -o wide`
    
    `$ kubectl get replicaset -o wide`
    
    `$ kubectl get po -o wide`
    
- Update image

  `$ kubectl set image deployment spse-deployment ....`
  
  - check status
  
    `$ kubectl rollout status deployment spse-deployment`
  
    `$ kubectl get deployments`
    
    `$ kubectl get rs`
    
    `$ kubectl describe rs spse-deployment-...`
    
    `$ kubectl get po -o wide`

- Delete Deployment

  `$ kubectl delete -f 03-deployment.yml`

## Setup concourse-docker-environment
- [Get Docker Engine - Community for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)

- [Install Docker Compose](https://docs.docker.com/compose/install/)

- Setup concourse-docker

  `$ cd workspace`
  
  `$ git clone https://github.com/concourse/concourse-docker.git`
  
  `$ concourse-docker/ssh`
  
  `$ ./generate`
  
  `$ cd ..`
  
- Modify docker-compose.yml

- docker-compose up

  `$ docker-compose up -d`
  
  `$ docker-compose ps`


## Clean-Up
- Delete GKE cluster

  `$ ./delete-sample-gke-cluster.sh`
  
- Delete GCP instance

  `$ ./delete-k8s-handson-steplinux.sh`
  
- Delete GCP network

  `$ ./delete-k8s-handson-network.sh`
