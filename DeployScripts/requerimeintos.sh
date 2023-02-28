#/bin/bash
az account set --subscription 55318ed6-5d8a-4bd2-889f-10e502960c28
az provider register -n Microsoft.RedHatOpenShift --wait
az provider register -n Microsoft.Compute --wait
az provider register -n Microsoft.Network --wait
az provider register -n Microsoft.Storage --wait

export LOCATION=westus3
export RESOURCEGROUP="arogbb$LOCATION"
export CLUSTER="arocluster01"
az group create --name $RESOURCEGROUP --location $LOCATION
az network vnet create --resource-group $RESOURCEGROUP --name aro-vnet --address-prefixes 192.168.192.0/24
az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name aro-vnet --name master-subnet --address-prefixes 192.168.192.0/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet create --resource-group $RESOURCEGROUP --vnet-name aro-vnet --name worker-subnet --address-prefixes 192.168.192.128/25 --service-endpoints Microsoft.ContainerRegistry
az network vnet subnet update --name master-subnet --resource-group $RESOURCEGROUP --vnet-name aro-vnet --disable-private-link-service-network-policies true
az aro create --resource-group $RESOURCEGROUP --name $CLUSTER --vnet aro-vnet --master-subnet master-subnet --worker-subnet worker-subnet --apiserver-visibility Public --ingress-visibility Public --domain aro1.jaropro.net --pull-secret @pull-secret.txt

az aro list-credentials --name $CLUSTER --resource-group $RESOURCEGROUP
#Ejemplo de Script
#az aro create --resource-group $RESOURCEGROUP --name $CLUSTER --vnet aro-vnet --master-subnet master-subnet --worker-subnet worker-subnet --apiserver-visibility Public --ingress-visibility Public --domain aro1.jaropro.net --pull-secret @pull-secret.txt --worker-vm-size Standard_D8as_v4
