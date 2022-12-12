module "firefly" {
  source                = "../../"
  firefly_access_key    = "FIREFLY_ACCESS_KEY"
  firefly_secret_key    = "FIREFLY_SECRET_KEY"
  name                  = "AWS_INTEGRATION"
  role_external_id      = "ROLE_EXTERNAL_ID"
}