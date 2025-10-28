#!/bin/bash
set -e

echo "===================================="
echo "DevOps Simulator - Production Deploy"
echo "===================================="

DEPLOY_ENV="production"
DEPLOY_REGION="us-east-1"
APP_PORT=8080

echo "Environment: $DEPLOY_ENV"
echo "Region: $DEPLOY_REGION"
echo "App Port: $APP_PORT"

echo "Deploying Production Build..."
# Simulated production deploy steps
sleep 1
echo "Production deploy complete."

echo "===================================="
echo "DevOps Simulator - Development Deploy"
echo "===================================="

DEPLOY_ENV="development"
DEPLOY_REGION="local"
APP_PORT=3000

echo "Environment: $DEPLOY_ENV"
echo "Region: $DEPLOY_REGION"
echo "App Port: $APP_PORT"

echo "Deploying Development Build..."
# Simulated dev deploy steps
sleep 1
echo "Development deploy complete."
