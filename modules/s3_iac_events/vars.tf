variable "region"{
  type = string
  description = "AWS region"
}

variable "bucket_names"{
  type = list(string)
  description = "The buckets to produce notifications from"
}

variable "sns_arn"{
  type = string
  description = "Firefly sns which receives s3 object events notification"
}

variable "suffix"{
  type = string
  default = "tfstate"
  description = "The s3 object extension to produce notifications from"
}

variable "prefix"{
  type = string
  default = ""
  description = "The s3 object prefix to produce notifications from"
}
