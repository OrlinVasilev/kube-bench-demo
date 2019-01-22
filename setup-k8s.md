yum update -y

sed -i '/swap/d' /etc/fstab

systemctl status firewalld
systemctl stop firewalld
systemctl disable firewalld

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF

# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable kubelet && systemctl start kubelet
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

yum install -y docker
systemctl enable docker
systemctl start docker

kubeadm config images pull

echo 192.168.43.100 secconf-master >> /etc/hosts
echo 192.168.43.101 secconf-node >> /etc/hosts

poweroff


kubeadm init --pod-network-cidr 100.100.0.0/16 --apiserver-advertise-address=192.168.43.100 


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


#kubectl taint nodes --all node-role.kubernetes.io/master-

#edit the cidr in calico.yaml to reflect 100.100.0.0/16


kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

kubectl label node secconf-node node-role.kubernetes.io/node=''

kubectl get pods --all-namespaces





#Join Node
kubeadm join 192.168.43.100:6443 --token jxyeiy.t4lqavpsjihbquk5 --discovery-token-ca-cert-hash sha256:55573c16eeb3998a4d511d07f36a534efe0a12cc0eb5068dcbcb9f57ca17c27a

  kubeadm join 192.168.43.100:6443 --token nghwbl.oqw2v9kktppuvjbb --discovery-token-ca-cert-hash sha256:8cb255b2cf9d9cefd0ca71ee8edec090bda16f6ae35e573369e3d4f3e82bcf56