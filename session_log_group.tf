# ------------------------------------------------------------------------------
# Provision the CloudWatch log group where the SSM session logs will be stored.
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "ssm_sessions" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = var.cloudwatch_log_group_retention
}
