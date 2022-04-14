# ------------------------------------------------------------------------------
# Create an SSM Document that allows creation of and configures
# parameters for SSM SessionManager sessions in this account.
# ------------------------------------------------------------------------------
resource "aws_ssm_document" "session_manager_preferences" {
  content = jsonencode({
    description = "Document to hold regional settings for Session Manager"
    # For a full list of input values, see here:
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-schema.html
    inputs = {
      cloudWatchEncryptionEnabled = false
      cloudWatchLogGroupName      = aws_cloudwatch_log_group.ssm_sessions.name
      cloudWatchStreamingEnabled  = true
      shellProfile = {
        linux   = var.linux_shell_profile
        windows = var.windows_shell_profile
      }
    }
    schemaVersion = "1.0"
    sessionType   = "Standard_Stream"
  })
  document_format = "JSON"
  document_type   = "Session"
  name            = "SSM-SessionManagerRunShell"
}
