output "firefly_token" {
  value = jsondecode(data.terracurl_request.firefly_login.response).access_token
}