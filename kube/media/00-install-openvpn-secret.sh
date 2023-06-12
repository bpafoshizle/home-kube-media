#!/bin/bash

kubectl --kubeconfig ~/.kube/bletchley-config \
    -n media \
    create secret generic openvpn \
        --from-literal=username="${VPN_USERNAME}" \
        --from-literal=password="${VPN_PASSWORD}" \