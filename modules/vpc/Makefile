# Makefile for deploying VPC module to AWS


ENV_PREFIX ?= default
TFVARS = tfvars/$(ENV_PREFIX).tfvars

init:
	terraform init

plan:
	terraform plan -var-file=$(TFVARS)

apply:
	terraform apply -var-file=$(TFVARS) -auto-approve

clean:
	rm -rf .terraform .terraform.lock.hcl

# Usage:
# ENV_PREFIX=dev make plan   # Plan with dev variables
# ENV_PREFIX=prod make apply # Apply with prod variables
# make clean                 # Remove Terraform state and lock files
