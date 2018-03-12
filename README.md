# Topology and Orchestration

Kubernetes/GCP Continuous Delivery files.


# Deployment:

1. Deploy the applications:

    * web.yaml
    * rancher.yaml
    * unifi.yaml

2. If successful, deploy the ingress for the web and unifi applications:

    * ingress.yaml

3. Once the ingress is deployed, and it has an target-https-proxy (tps) deployed, update the SSL to include both:

```
gcloud compute target-https-proxies list
# Ex: k8s-tps-default-primary-ingress--23123123123123
gcloud compute target-https-proxies update k8s-tps-default-primary-ingress--23123123123123 --ssl-certificate www-4lambda-io,rancher-4lambda-io
```

### License & Copyright

MIT
Copyright 2018 4Lambda LLC; Russell Bunch
