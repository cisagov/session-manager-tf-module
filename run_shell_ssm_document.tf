# ------------------------------------------------------------------------------
# Create an SSM Document that allows creation of and configures
# parameters for SSM SessionManager sessions in this account.
# ------------------------------------------------------------------------------
module "session-manager-settings" {
  source = "gazoakley/session-manager-settings/aws"

  cloudwatch_encryption_enabled = true
  cloudwatch_log_group_name     = var.cloudwatch_log_group_name
  s3_bucket_name                = aws_s3_bucket.ssm_sessions.id
  s3_encryption_enabled         = true
}
