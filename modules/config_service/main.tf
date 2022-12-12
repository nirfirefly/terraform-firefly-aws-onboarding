resource "aws_config_delivery_channel" "s3_delivery_channel" {
  name           = "s3-delivery-channel"
  s3_bucket_name = var.config_bucket_name
  depends_on     = [aws_config_configuration_recorder.config_configuration_recorder]
}

resource "aws_config_configuration_recorder" "config_configuration_recorder" {
  name     = "recorder"
  role_arn = var.config_service_role_arn
  recording_group {
    all_supported = true
    include_global_resource_types = var.region == local.global_services_region ? true : false
  }
}

resource "aws_config_configuration_recorder_status" "config_status" {
  name       = aws_config_configuration_recorder.config_configuration_recorder.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.s3_delivery_channel]
}
