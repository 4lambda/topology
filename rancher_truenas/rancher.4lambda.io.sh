# Using 1.22.8-gke.202

# Get credentials; replace cluster-1 with actual cluster name.
gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project sylvan-triumph-161508

export HELM_EXPERIMENTAL_OCI=1

# Install latest ingress-nginx controller
helm upgrade --install \
    ingress-nginx ingress-nginx/ingress-nginx \
    --namespace ingress-nginx \
    --set controller.service.type=LoadBalancer \
    --create-namespace

# Get the external IP and add it to DNS
kubectl get service ingress-nginx-controller --namespace=ingress-nginx

# Apply this since we're not going to run the cert-manager with --set installCRDs=true
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml

# Install rancher
helm install rancher rancher-latest/rancher \
    --namespace cattle-system \
    --set hostname=rancher.4lambda.io \
    --set bootstrapPassword=admin \
    --set ingress.tls.source=letsEncrypt \
    --set letsEncrypt.email=rusty@4lambda.io \
    --set letsEncrypt.ingress.class=nginx

# Check the rancher ingress and make sure it has kubernetes.io/ingress.class: "nginx" set in its annotations.
kubectl -n cattle-system edit ingress

# If kubernetes.io/ingress.class: "nginx" wasn't set, kill/restart ingress-nginx
kubectl delete pod ingress-nginx-controller-5756658855-p9rbz -n ingress-nginx

# Tail the logs of the new pod
kubectl delete pod ingress-nginx-controller-<pod-details> -n ingress-nginx
