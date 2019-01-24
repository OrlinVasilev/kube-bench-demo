#!/bin/bash

kubectl delete ns meetup secconf || true
kubectl delete psp --all || true
kubectl delete networkpolicy --all || true

./demo2-docker-psp-taints/remove-psp-kube-api.sh