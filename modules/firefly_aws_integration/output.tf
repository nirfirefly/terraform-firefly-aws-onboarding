output "firefly_integration_role_name" {
  value = aws_iam_role.firefly_cross_account_access_role.name
}

output "firefly_integration_role_arn" {
  value = aws_iam_role.firefly_cross_account_access_role.arn
}

output "template_vesion" {
  value = local.version
}