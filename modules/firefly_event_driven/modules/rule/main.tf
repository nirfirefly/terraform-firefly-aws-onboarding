resource "aws_cloudwatch_event_rule" "rule" {
  name        = "firefly-events-${var.rule_name}"
  description = "${var.service} Cloud Trail to Firefly event bus"
  event_pattern = var.event_pattarn
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "SendToExternalEventBus"
  arn       = var.target_event_bus_arn
  role_arn  = var.eventbridge_role_arn
}
