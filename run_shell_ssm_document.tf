# ------------------------------------------------------------------------------
# Create an SSM Document that allows creation of and configures
# parameters for SSM SessionManager sessions in this account.
# ------------------------------------------------------------------------------
resource "aws_ssm_document" "session_manager_preferences" {
  content = jsonencode({
    schemaVersion = "1.0"
    description   = "Document to hold regional settings for Session Manager"
    sessionType   = "Standard_Stream"
    # For a full list of input values, see here:
    # https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-schema.html
    inputs = {
      cloudWatchEncryptionEnabled = false
      cloudWatchLogGroupName      = aws_cloudwatch_log_group.ssm_sessions.name
      cloudWatchStreamingEnabled  = true
      # idleSessionTimeout = 20
      # kmsKeyId                    = aws_kms_key.ssmkey.key_id
      # maxSessionDuration = 60
      # runAsEnabled = true
      # runAsDefaultUser = MyDefaultRunAsUser"
      s3BucketName        = aws_s3_bucket.ssm_sessions.id
      s3EncryptionEnabled = false
      # s3KeyPrefix                 = ""
      shellProfile = {
        linux = "bash; cd"
        # windows = ""
      }
    }
  })
  document_format = "JSON"
  document_type   = "Session"
  name            = "SSM-SessionManagerRunShell"
}
