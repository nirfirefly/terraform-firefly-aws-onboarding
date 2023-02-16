variable "service"{
  type = string
}

variable "rule_name"{
  type = string
}

variable "event_pattarn"{

}

variable "target_event_bus_arn"{
  type = string
}

variable "eventbridge_role_arn"{
  type = string
}

variable "tags" {
  type = map
  default = {}
  description = "Tags to apply to all created AWS resources"
}
