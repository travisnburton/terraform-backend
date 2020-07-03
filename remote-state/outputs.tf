output "account" {
    value = data.aws_caller_identity.current.account_id
}

output "s3_bucket_name" {
    value = aws_s3_bucket.tfstate.id
}

output "region" {
    value = aws_s3_bucket.tfstate.region
}