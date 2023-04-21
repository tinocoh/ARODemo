#/bin/bash
export LOCATION=westus3
export RESOURCEGROUP="arogbb$LOCATION"
export CLUSTER="arocluster$LOCATION"
az aro list-credentials --name $CLUSTER --resource-group $RESOURCEGROUP
