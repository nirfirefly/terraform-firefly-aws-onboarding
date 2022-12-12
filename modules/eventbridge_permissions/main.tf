data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_iam_policy" "firefly_eventbridge_permission" {
  name        = "fireflyEventDrivenRulesPermission"
  path        = "/"
  description = "permission to put eventbridge rules"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
          "Action": [
            "events:*"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:events:*:${local.account_id}:rule/firefly-events-*"
        },
        {
            "Effect": "Allow",
            "Action": [
              "iam:PassRole"
            ],
            "Resource": aws_iam_role.invoke_firefly_event_bus.arn,
            "Condition": {
                  "StringEquals": {"iam:PassedToService": "events.amazonaws.com"}
              }
          }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "firefly_eventbridge_permissions" {
  role       = var.firefly_role_name
  policy_arn = aws_iam_policy.firefly_eventbridge_permission.arn
}


// this role is dedicated for events service
resource "aws_iam_role" "invoke_firefly_event_bus" {
  name               = "invoke-firefly-remote-event-bus"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "invoke_firefly_event_bus" {
  name   = "invoke-firefly-remote-event-bus"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
          "Action": [
            "events:PutEvents"
          ],
          "Effect": "Allow",
          "Resource": var.target_event_bus_arn
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "invoke_firefly_event_bus" {
  role       = aws_iam_role.invoke_firefly_event_bus.name
  policy_arn = aws_iam_policy.invoke_firefly_event_bus.arn
}