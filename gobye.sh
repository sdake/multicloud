# Copyright (C) 2019 Steven Dake
#
# Licensed with the ASL2 license

# Delete specific services across all 3 clouds
cl1
kubectl delete -f manifests/us.yaml
cl2
kubectl delete -f manifests/emea.yaml
cl3
kubectl delete -f manifests/apac.yaml


# Delete specific SEs for services deployed to us
cl2
kubectl delete -f manifests_se/us/
cl3
kubectl delete -f manifests_se/us/


# Delete specific SEs for services deployed to emea
cl1
kubectl delete -f manifests_se/emea/
cl3
kubectl delete -f manifests_se/emea/


# Delete specific SEs for services deployed to apac
cl1
kubectl delete -f manifests_se/apac/
cl2
kubectl delete -f manifests_se/apac/
