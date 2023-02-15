variable "target_event_bus_arn"{
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
