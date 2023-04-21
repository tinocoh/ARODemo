#/bin/bash
export LOCATION=southcentralus
export RESOURCEGROUP="arogbb$LOCATION"
export CLUSTER="arocluster$LOCATION"
# Optener Regiones
az account list-locations
# Optener VM list
#az vm list-sizes -l southcentralus
az aro create --resource-group $RESOURCEGROUP --name $CLUSTER --vnet aro-vnet --master-subnet master-subnet --worker-subnet worker-subnet --apiserver-visibility Public --ingress-visibility Public --domain foo.example.com --pull-secret @pull-secret.txt --worker-vm-size Standard_D8as_v4

UPDATE.