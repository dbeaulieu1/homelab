this terraform project allow to deploy Rancher Cluster
# TLS Certificates

TThs is repo contains Terraform files to deploy cert-manager containars  on Azure Kubernetes Service (AKS) and configure it to get signed certificate from Let's Encrypt.

This will allow  clients to connect with  HTTPS securely.

Configure cert-manager to use the Let's Encrypt DNS-01 challenge protocol with Azure DNS, using workload identity federation to authenticate to Azure.

> [!NOTE]
> cert-manager and certificate def is based on article [Deploy cert-manager on Azure Kubernetes Service AKS and use Let's Encrypt to sign a certificate for an HTTPS website](https://cert-manager.io/docs/tutorials/getting-started-aks-letsencrypt/#install-cert-manager)</br>

> [!IMPORTANT]
> AKS Cluster configuration explained in article above is done via 1-aks/main.tf

# Prerequisite

Run 
> az provider register --namespace Microsoft.ContainerService


# step 1, connect kubectl to aks cluster if not already done
az aks get-credentials --admin --resource-group rg-aks-cnc --name aks-aiimpact-cnc

# step 2, deploy helm charts 
terraform apply -auto-approve

# Additional information

Tutorial on deploying cert-manager on Azure Kubernetes Service (AKS) and using Let's Encrypt to sign a certificate for an HTTPS website:

## Overview
This tutorial guides you through deploying and configuring cert-manager on AKS to obtain a signed certificate from Let's Encrypt. The steps include:
1. Setting Up Azure CLI: Install and configure the Azure CLI for interactive use.
2. Creating a Public Domain Name: Register a domain name for your website.
3. Deploying cert-manager: Install cert-manager on your Azure Kubernetes cluster.
4. Configuring cert-manager: Set up cert-manager to use the Let's Encrypt DNS-01 challenge protocol with Azure DNS.
5. Deploying an HTTPS Web Server: Deploy a web server that responds to HTTPS requests using the obtained SSL certificate.
## Key Points
- Azure CLI Configuration: Ensure you have the correct version and set up your resource group and location.
- Domain Registration: Necessary for making your website publicly accessible.
- SSL Certificates: Initially, a test certificate is created, followed by a trusted SSL certificate for production use.
For more detailed steps and commands, you can refer to the full tutorial here [1](https://cert-manager.io/docs/tutorials/getting-started-aks-letsencrypt/#install-cert-manager)).
Is there a specific part of the tutorial you'd like more details on?
References
[1]((https://cert-manager.io/docs/tutorials/getting-started-aks-letsencrypt/#install-cert-manager)) Deploy cert-manager on Azure Kubernetes Service (AKS) and use Let's ...


