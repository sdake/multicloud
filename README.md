# Istio Three (3) Cluster Multicloud Demo

This is a demonstration of the [Hipster Shop](https://github.com/GoogleCloudPlatform/microservices-demo) running across three Kubernetes environments
(Azure, GKE, and On-premises) using [Istio](https://istio.io).  The
demonstration was originally given to the audience at
[KubeCon EU 2019](https://sched.co/MPbL):

- [Reinventing Networking: A Deep Dive into Istio's Multicluster Gateways - Steve Dake, Independent](https://youtu.be/-t2BfT59zJA)

For those that want to skip ahead, the
[demo is here](https://youtu.be/-t2BfT59zJA?t=982).

The objective of this repository is to teach new contributors how multicloud
works with [Istio](https://istio.io).  As such, nothing all that advanced
is used beyond `bash`, `helm`, and `kubectl` commands.  Once you are up
to speed, come [join us](https://istio.io/about/community/join/)
develop `#multicloud` in the [Istio](https://github.com/istio) project.

## Architecture

The Hipster Shop includes 10 microservices.  Full details of the architecture
and implementation of the Hipster Shop are available in that project.  This
architecture diagram shows how the Hipster shop is split across 3 clouds.

<img src="./assets/Kubecon 2019 EU - Hipster Architecture Diagram.svg">


## Files in this repository

| Component | Description |
| --- | --- |
| `license_header.txt` | A license header placed at the front of every K8s manifest |
| `make-manifests.sh` | Creates K8s manifests from a git clone of `../microservices-demo` |
| `manifests` | Manifests generated from the `make-manifests.sh` script |
| `onprem` | Scripts to install docker, kubeadm/kubelet, and deploy Kubernetes |

## Deploying the three (3) Kubernetes environments:

These steps are incomplete.  This text will be removed when the steps are
accurate and confirmed.

### Prequisities

- There must be at minimum one Kubernetes control plane node and 1 Kubernetes
  worker node.  Most kubernetes cloud controllers suffer from
  [an issue](https://github.com/kubernetes/kubeadm/issues/425)
  that does not permit the scheduling of services of type load balancer to an
  `all-in-one` deployment.
- For On-Premises clusters using
  [metallb](https://metallb.universe.tf/installation/), `all-in-one`
  deployments Of Kubernetes and Istio work well.
- Three clusters are needed.  This demo uses Azure AKS, Google Cloud's GKE,
  and Kubernetes deployed on-premesis.  The demo works equally well in one cloud
  provider or many.  To demonstrate the full power of [Istio](https://istio.io)
  the most challenging deployment scenario was chosen.
- Each cluster must implement a proper load balancer.  Network load balancers
  are the optimal choice, although others can be made to work with some
  specific hacks, err, `systems engineering`.
- One load balancer must be available in the quota of the cloud provider.
- Sufficient security group rules quota must be available for Istio and the
  demonstration app.  I have found through experimentation this number is
  at most 200 rules per cluster.  Amazon Web Services defaults to 60 security
  groups per VPC, so you will need to request a quota increase to run
  this demo against AWS.
- Each cluster must meet the minimum requirements below to launch the demo
  properly.  The CPU/Memory requests have been set to their minimums for Istio
  in the Istio manifests.

| CPU | Memory |
| --- | --- |
| 10 vCPU | 16.0 GiB |

### Deploy an AKS cluster

Please follow the 5 minute quickstart for [Azure CLI](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough) or [Azure Portal](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal) to deploy a properly sized K8s cluster.

### Deploy a GKE cluster

Please follow the [GKE How-To](https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-cluster) to deploy a properly sized K8s cluster.

### Deploy an On-Premises cluster

Please install Kubernetes and kubeadm and deploy an `all-in-one` cluster with
[metallb](https://metallb.universe.tf/installation/).

There are several helper scripts in the `onprem` directory to install Kubernetes
and depooy Kubernetes 1.14.2 with metallb.  I recommend using these if you don't
already have Kubernetes up and running.

In any event, it is mandatory to intall a Load Balancer provider.  Typically
this is provided by an internal or external cloud provider, however, in the
case of bare metal, metallb works well for this purpose.
