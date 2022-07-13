#!/bin/bash

helm repo add democratic-csi https://democratic-csi.github.io/charts/
helm repo update
helm search repo democratic-csi/

echo Double-check that the SSH user has authorized_keys setup that match the privateKey

helm upgrade --install --values freenas-nfs.yaml --namespace democratic-csi --create-namespace zfs-nfs democratic-csi/democratic-csi
helm upgrade --install --values freenas-iscsi.yaml --namespace democratic-csi --create-namespace zfs-iscsi democratic-csi/democratic-csi

