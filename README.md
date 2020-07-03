# terraform-backend
Create an S3 backend for Terraform with DynamoDB table for state locking/consistency

## Requirements
* Terraform (v0.12+ recommended)

## Usage
Set desired AWS region in remote-state/vars.tf

Set environment variables for AWS access keys
```
export AWS_ACCESS_KEY_ID=****************
export AWS_SECRET_ACCESS_KEY=****************
```


Execute Terraform
```
./bootstrap.sh
```
