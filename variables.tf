# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
  type        = string
}

variable "cloudwatch_log_group_name" {
  default     = "/ssm/session-logs"
  description = "The name of the log group into which session logs are to be uploaded."
  type        = string
}

variable "cloudwatch_log_group_retention" {
  default     = 365
  description = "The number of days that SSM session logs will be retained in CloudWatch."
  type        = number
}

variable "other_accounts" {
  default     = []
  description = "A list of account IDs, each of which corresponds to an account to which access to the IAM role that allows creation of SSM SessionManager sessions to any EC2 instance in this account will be delegated."
  type        = list(string)
}

variable "s3_bucket_name_prefix" {
  default     = "ssm-session-logs-"
  description = "The prefix of the name of the S3 bucket in which session logs are to be stored.  A random string will be appended to this prefix in order to create a unique S3 bucket name."
  type        = string
}

variable "ssmsession_role_description" {
  description = "The description to associate with the IAM role (and policy) that allows creation of SSM SessionManager sessions to any EC2 instance in this account."
  default     = "Allows creation of SSM SessionManager sessions to any EC2 instance in this account."
  type        = string
}

variable "ssmsession_role_name" {
  description = "The name to assign the IAM role (and policy) that allows creation of SSM SessionManager sessions to any EC2 instance in this account."
  default     = "StartStopSSMSession"
  type        = string
}
