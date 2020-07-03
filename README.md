# terraform-backend
Create an S3 backend for Terraform with DynamoDB table for state locking/consistency

## Requirements
* Terraform (v0.12+ recommended)

## Usage
Set desired AWS region in remote-state/vars.tf

Execute Terraform
```
./bootstrap.sh
```
