#!/usr/bin/env bash

GCP_PROJECT=$(gcloud config get-value core/project)
if [ "$GCP_PROJECT" != "" ]; then
    export GCP_PROJECT=$GCP_PROJECT; echo "Your default GCP project is $GCP_PROJECT";
else 
    echo "Error: GCP_PROJECT is not set.";
    echo "Please follow the instructions and run 'gcloud init' first" && exit 1;
fi

GCP_REGION=$(gcloud config get-value compute/region)
if [ "$GCP_REGION" != "" ]; then
    export GCP_REGION=$GCP_REGION; echo "Your default GCP region is $GCP_REGION";
else 
    echo "Error: GCP_REGION is not set.";
    echo "Please choose your default GCP region and run 'gcloud config set compute/region REGION'" && exit 1;
fi

GCP_ZONE=$(gcloud config get-value compute/zone)
if [ "$GCP_ZONE" != "" ]; then
    export GCP_ZONE=$GCP_ZONE; echo "Your default GCP zone is $GCP_ZONE";
else 
    echo "Error: GCP_ZONE is not set.";
    echo "Please choose your default GCP zone and run 'gcloud config set compute/zone ZONE'" && exit 1;
fi

GCP_DEFAULT_SA=$(gcloud iam service-accounts list --filter="NAME:Compute Engine default service account" --format="value(EMAIL)")
if [ "$GCP_DEFAULT_SA" != "" ]; then
    export GCP_DEFAULT_SA=$GCP_DEFAULT_SA; echo "Your default GCP service account is $GCP_DEFAULT_SA";
else 
    echo "Error: GCP_DEFAULT_SA is not set.";
    echo "Something went wrong'" && exit 1;
fi

# GCP required APIs list 
export GCP_API_LIST=(
    'container.googleapis.com'
    'containerregistry.googleapis.com'
    'iam.googleapis.com'
    'sql-component.googleapis.com'
    'sqladmin.googleapis.com'
)

# Service acounts roles
export SQL_SA_ROLES=(
    'roles/cloudsql.client'
)

export GKE_SA_ROLES=(
    'roles/storage.objectViewer'
    'roles/logging.logWriter'
    'roles/monitoring.metricWriter'
    'roles/monitoring.viewer'
)

export SA_ROLES=(
    'roles/editor'
    'roles/iam.serviceAccountUser'
)
