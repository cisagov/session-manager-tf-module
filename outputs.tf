output "ssm_document_name" {
  description = "Name of the SSM document that can be used to create SSM SessionManager session in this account."
  value       = module.session-manager-settings.document_name
}

output "ssm_document_arn" {
  description = "ARN of the SSM document that can be used to create SSM SessionManager session in this account."
  value       = module.session-manager-settings.document_arn
}

output "ssm_session_bucket" {
  description = "The S3 bucket where SSM session logs will be stored."
  value       = aws_s3_bucket.ssm_sessions
}

output "ssm_session_log_group" {
  description = "The CloudWatch log group where SSM session logs will be stored."
  value       = aws_cloudwatch_log_group.ssm_sessions
}
