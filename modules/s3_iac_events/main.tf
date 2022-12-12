resource "aws_s3_bucket_notification" "aws_events_bucket_notification" {
  for_each = toset(var.bucket_names)
  bucket = each.key
  topic {
    id            = "firefly-iac-states-update-notification"
    events        = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*", "s3:ObjectRestore:Completed"]
    filter_suffix = var.suffix
    filter_prefix = var.prefix
    topic_arn     =  var.sns_arn
  }
}