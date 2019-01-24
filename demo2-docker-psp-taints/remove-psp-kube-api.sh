ssh scm -- sed -i 's/NodeRestriction\,PodSecurityPolicy/NodeRestriction/g' /etc/kubernetes/manifests/kube-apiserver.yaml
