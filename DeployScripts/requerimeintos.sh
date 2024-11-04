#/bin/bash
az login --use-device-code --tenant 16b3c013-d300-468d-ac64-7eda0820b6d3
export LOCATION="westus3"
export RESOURCEGROUP="arogbb$LOCATION"
export CLUSTER="arocluster$LOCATION"
az group create --name $RESOURCEGROUP --location $LOCATION
az network vnet create --resource-group $RESOURCEGROUP --name aro-vnet --address-prefixes 192.168.192.0/24
az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name aro-vnet --name master-subnet --address-prefixes 192.168.192.0/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name aro-vnet --name worker-subnet --address-prefixes 192.168.192.128/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet update --name master-subnet --resource-group $RESOURCEGROUP --vnet-name aro-vnet --disable-private-link-service-network-policies true

Powershell

#/bin/bash
az login --use-device-code --tenant 16b3c013-d300-468d-ac64-7eda0820b6d3
export LOCATION="westus3"
export RESOURCEGROUP="arogbbwestus3"
export CLUSTER="aroclusterwestus3"
az group create --name arogbbwestus3 --location westus3
az network vnet create --resource-group arogbbwestus3 --name aro-vnet --address-prefixes 192.168.192.0/24
az network vnet subnet create --resource-group arogbbwestus3 --vnet-name aro-vnet --name master-subnet --address-prefixes 192.168.192.0/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet create --resource-group arogbbwestus3 --vnet-name aro-vnet --name worker-subnet --address-prefixes 192.168.192.128/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet update --name master-subnet --resource-group arogbbwestus3 --vnet-name aro-vnet --disable-private-link-service-network-policies true
az aro create --resource-group arogbbwestus3 --name arolatamgbb --vnet aro-vnet --master-subnet master-subnet --worker-subnet worker-subnet --apiserver-visibility Private --ingress-visibility Private --domain aroarolatamgbb.jaropro.net --pull-secret @pull-secret.txt

az aro list-credentials --name aroclusterwestus3 --resource-group arogbbwestus3
