variable "config_service_role_arn" {
  type = string
}

variable "config_bucket_name" {
  type = string
}

variable "region" {
  type = string
}

variable "config_service_regions" {
  type        = list(string)
  description = "The list of regions to activate config service recorder"
  default     = []
}
