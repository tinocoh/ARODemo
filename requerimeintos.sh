#/bin/bash
export LOCATION=southcentralus
export RESOURCEGROUP="arogbb$LOCATION"
export CLUSTER="arocluster$LOCATION"
az group create --name $RESOURCEGROUP --location $LOCATION
az network vnet create --resource-group $RESOURCEGROUP --name aro-vnet --address-prefixes 192.168.192.0/24
az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name aro-vnet --name master-subnet --address-prefixes 192.168.192.0/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name aro-vnet --name worker-subnet --address-prefixes 192.168.192.128/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet update --name master-subnet --resource-group $RESOURCEGROUP --vnet-name aro-vnet --disable-private-link-service-network-policies true
