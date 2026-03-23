#!/bin/bash

echo "🚀 Starting Nutanix DevOps Project..."

cd terraform
terraform init
terraform apply -auto-approve

echo "✅ Deployment complete!"
echo "🌐 Open: http://localhost:5001"