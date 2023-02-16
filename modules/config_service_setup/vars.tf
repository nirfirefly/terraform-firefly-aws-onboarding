variable "firefly_deny_policy_name" {
  type = string
}

variable "firefly_role_name"{
  type = string
}

variable "tags" {
  type = map
  default = {}
  description = "Tags to apply to all created AWS resources"
}