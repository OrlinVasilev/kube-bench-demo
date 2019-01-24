ssh scm -- sed -i 's/NodeRestriction/NodeRestriction\,PodSecurityPolicy/g' /etc/kubernetes/manifests/kube-apiserver.yaml
