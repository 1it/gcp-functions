#!/usr/bin/env bash 

TF_VERSION=${TF_VERSION:-0.12.23}

if ! which terraform > /dev/null; then
    echo -e "Error: terraform is not installed. \n"
    echo -e "Proceed to download and install Terraform v$TF_VERSION?"
    read -t 60 -p "Press [Enter] to proceed or [Ctrl]-[C] to exit"
    echo -e "Downloading ... \n"
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_darwin_amd64.zip
        sudo unzip -uo unzip terraform_${TF_VERSION}_darwin_amd64.zip -d /usr/local/bin/
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
        sudo unzip -uo terraform_${TF_VERSION}_linux_amd64.zip -d /usr/local/bin/
    fi
fi

if ! which gcloud > /dev/null; then echo "Error: gcloud is not installed" && exit 1; fi
if ! which kubectl > /dev/null; then echo "Error: kubectl is not installed" && exit 1; fi
