#!/bin/bash 

if [ $# -ne 1 ]; then
    echo "[-] No path specified"
    echo "Usage: $0 <[chrome|firefox|edge|grid]>"
    exit 1
fi


SELENIUM_NODE_NAME=$1
APPLICATION_DEPLOYMENT_FILENAME="../../application-deployment.yaml"



sed -i "s|path:.*|path: $SELENIUM_NODE_NAME|g" $APPLICATION_DEPLOYMENT_FILENAME
echo "[+] Path set to $SELENIUM_NODE_NAME"

echo "[*] Applying the deployment to cluster"
kubectl apply -f $deployment_yaml

echo "[*] Waiting for deployment to complete"
kubectl rollout status deployment/myapp-argo-application

echo "[+] Deployment completed"

echo "--------------------------"
echo "[+] DEPLOYED SUCCESSFULLY"
echo "---------------------------"
