#!/bin/bash

case $1 in
  "up")
    sudo kubeadm init
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown armando. $HOME/.kube/config
    kubectl taint nodes --all node-role.kubernetes.io/master-
    kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
    ;;
  "down")
    rm -rf $HOME/.kube
    sudo kubeadm reset
    ;;
esac
