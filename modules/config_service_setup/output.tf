output "delivery_bucket_name" {
  value = aws_s3_bucket.config_bucket.bucket
}

output "config_service_role_arn" {
  value = aws_iam_role.aws_config_role.arn
}