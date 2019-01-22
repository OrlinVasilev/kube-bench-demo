kubectl get nodes -o json | jq .items[].spec.taints
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl get nodes -o json | jq .items[].spec.taints
