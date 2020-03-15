#!/usr/bin/env bash 

TF_VERSION=${TF_VERSION:-0.12.23}

if ! which terraform > /dev/null; then
	echo -e "Error: terraform is not installed. Downloading ... \n"
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
