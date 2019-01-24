#!/bin/bash

kubectl get pods --all-namespaces 
kubectl get psp --all-namespaces
kubectl get networkpolicy --all-namespaces
kubectl get ns secconf

kubectl delete ns secconf || true
kubectl delete psp default privilaged || true