# ------------------------------------------------------------------------------
# Create the IAM role that allows creation of SSM SessionManager
# sessions to any EC2 instance in this account.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "ssm_session_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.ssm_session_role_description
  name               = var.ssm_session_role_name
}

resource "aws_iam_role_policy_attachment" "ssm_session_policy_attachment" {
  policy_arn = aws_iam_policy.ssm_session_policy.arn
  role       = aws_iam_role.ssm_session_role.name
}
