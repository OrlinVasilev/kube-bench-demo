kubectl get nodes -o json | jq .items[].spec.taints
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes secconf-master node-role.kubernetes.io-
kubectl get nodes -o json | jq .items[].spec.taints
