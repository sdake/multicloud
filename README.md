# Istio Three (3) Cluster Multicloud Demo

This is a demonstration of the [Hipster Shop](https://github.com/GoogleCloudPlatform/microservices-demo) running across three Kubernetes environments
(Azure, GKE, and On-premises) using [Istio](https://istio.io).  The
demonstration was originally given to the audience at
[KubeCon EU 2019](https://sched.co/MPbL):

- [Reinventing Networking: A Deep Dive into Istio's Multicluster Gateways - Steve Dake, Independent](https://youtu.be/-t2BfT59zJA)

## Files in this repository

| Component | Description |
| --- | --- |
| `license_header.txt` | A license header placed at the front of every K8s manifest |
| `make-manifests.sh` | Creates K8s manifests from a git clone of `../microservices-demo` |
| `manifests` | Manifests generated from the `make-manifests.sh` script |

## Deploying the three (3) Kubernetes environments:

These steps are incomplete.  This text will be removed when the steps are
accurate and confirmed.

### Deploy an AKS cluster

Please follow the 5 minute quickstart for [Azure CLI](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough) or [Azure Portal](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal) to deploy a properly sized K8s cluster.  At this time, a properly sized Cluster includes 3 nodes, 8 vCPUs, and atleast 16gb of RAM.

### Deploy a GKE cluster

Please follow the [GKE How-To](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-cluster) to deploy a properly sized K8s cluster.  At this time, a properly sized cluster includes 3 nodes, 8 vCPUs, and atleast 16gb of RAM.
