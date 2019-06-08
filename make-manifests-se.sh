# Copyright 2019 Steven Dake
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

# Please set these gateways to the ingress gateway of the 3 clusters:
#
# For the mmajority of cloud providers that expose a load balancer as
# an IP address, obtain the ingress gateway IP on load balancers that
# expose an IP address
# kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
#
# Alternately, for cloud providers that expose load balancers via DNS names:
# kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
#
# All SEs in this example use STATIC.  If your cloud provider's load balancer
# uses DNS names, you will # need to change the resolution field from STATIC
# to DYNAMIC for service entries in the relevant service # entry files.  This
# teaches Istio to use DNS to resolve the gateway address.
#
# The service entries expect you are using the default mutual TLS
# auto-passthrough # gateway # port of 15443.  If this is not the
# case (i.e. you are using # nodeport), please modify the service
# entries appropriately.

# Azure
GATEWAY1="1.1.1.1"

# Google
GATEWAY2="2.2.2.2"

# On-Premises
GATEWAY3="3.3.3.3"

mkdir -p manifests_se
cp -r istio/service_entries/ manifests_se

for SERVICE_ENTRY in manifests_se/azure/*yaml manifests_se/google/*yaml manifests_se/onprem/*yaml;
do
	sed -i.bak "s/GATEWAY1/${GATEWAY1}/g" ${SERVICE_ENTRY}
	rm -f ${SERVICE_ENTRY}.bak
	sed -i.bak "s/GATEWAY2/${GATEWAY2}/g" ${SERVICE_ENTRY}
	rm -f ${SERVICE_ENTRY}.bak
	sed -i.bak "s/GATEWAY3/${GATEWAY3}/g" ${SERVICE_ENTRY}
	rm -f ${SERVICE_ENTRY}.bak
done
