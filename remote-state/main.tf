# Bootstrap Terraform remote state S3 bucket and DynamoDB table

provider "aws" {
    region = var.region
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "tfstate" {
    bucket = "${data.aws_caller_identity.current.account_id}-${var.region}-tfstate"
    acl    = "private"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
    bucket = aws_s3_bucket.tfstate.id
    block_public_acls = true
    block_public_policy = true
}

resource "aws_dynamodb_table" "tfstate_lock" {
    name = "tfstate"
    billing_mode = "PAY_PER_REQUEST"
    read_capacity = 1
    write_capacity = 1
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}
