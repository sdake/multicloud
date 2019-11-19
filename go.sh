# Copyright (C) 2019 Steven Dake
#
# Licensed with the ASL2 license

# Apply specific services across all 3 clouds
cl1
kubectl apply -f manifests/us.yaml
cl2
kubectl apply -f manifests/emea.yaml
cl3
kubectl apply -f manifests/apac.yaml


# Apply specific SEs for services deployed to us
cl2
kubectl apply -f manifests_se/us/
cl3
kubectl apply -f manifests_se/us/


# Apply specific SEs for services deployed to emea
cl1
kubectl apply -f manifests_se/emea/
cl3
kubectl apply -f manifests_se/emea/


# Apply specific SEs for services deployed to apac
cl1
kubectl apply -f manifests_se/apac/
cl2
kubectl apply -f manifests_se/apac/
