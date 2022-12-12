variable "service" {
  type = string
}

variable "rule_name"{
  type = string
}

variable "rules" { 
  type = list(string)
}

variable "running_region" {
  type = string
}

variable "service_regions"{
  type = list(string)
}

variable "target_event_bus_arn"{
  type = string
}

variable "eventbridge_role_arn"{
  type = string
}