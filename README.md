# kubernetes-handson-sample
kubernetes handson sample document

## Description

## Requirement

## Preparation

## Usage

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

## Handson-step

## Clean-Up
