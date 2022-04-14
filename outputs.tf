output "ssm_document" {
  description = "The SSM document that can be used to create SSM SessionManager session in this account."
  value       = aws_ssm_document.session_manager_preferences
}

output "ssm_session_bucket" {
  description = "The S3 bucket where SSM session logs will be stored."
  value       = aws_s3_bucket.ssm_sessions
}

output "ssm_session_log_group" {
  description = "The CloudWatch log group where SSM session logs will be stored."
  value       = aws_cloudwatch_log_group.ssm_sessions
}

output "ssm_session_role" {
  description = "The IAM role that allows creation of SSM SessionManager sessions to any EC2 instance in this account."
  value       = aws_iam_role.ssmsession_role
}
