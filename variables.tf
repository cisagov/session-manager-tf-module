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

variable "linux_shell_profile" {
  description = "The shell setup to run when connecting to a Linux instance.  Note that this string cannot be empty."
  default     = "exec bash; cd"
  type        = string
  validation {
    condition     = var.linux_shell_profile != ""
    error_message = "The Linux shell profile cannot be an empty string."
  }
}

variable "other_accounts" {
  default     = []
  description = "A list of account IDs, each of which corresponds to an account to which access to the IAM role that allows creation of SSM Session Manager sessions to any EC2 instance in this account will be delegated."
  type        = list(string)
}

variable "ssm_session_role_description" {
  description = "The description to associate with the IAM role (and policy) that allows creation of SSM Session Manager sessions to any EC2 instance in this account."
  default     = "Allows creation of SSM Session Manager sessions to any EC2 instance in this account."
  type        = string
}

variable "ssm_session_role_name" {
  description = "The name to assign the IAM role (and policy) that allows creation of SSM Session Manager sessions to any EC2 instance in this account."
  default     = "StartStopSSMSession"
  type        = string
}

variable "windows_shell_profile" {
  description = "The shell setup to run when connecting to a Windows instance.  Note that this string cannot be empty."
  default     = "date"
  type        = string
  validation {
    condition     = var.windows_shell_profile != ""
    error_message = "The Windows shell profile cannot be an empty string."
  }
}
