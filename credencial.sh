#/bin/bash
export LOCATION=southcentralus
export RESOURCEGROUP="arogbb$LOCATION"
export CLUSTER="arocluster$LOCATION"
az aro list-credentials --name $CLUSTER --resource-group $RESOURCEGROUP
