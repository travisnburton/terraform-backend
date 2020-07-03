output "s3_bucket" {
    value = aws_s3_bucket.tfstate.id
}

output "region" {
    value = aws_s3_bucket.tfstate.region
}