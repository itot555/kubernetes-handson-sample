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

## Handson-step

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

## Clean-Up
