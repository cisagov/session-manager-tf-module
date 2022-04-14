# ------------------------------------------------------------------------------
# Create the IAM policy that allows creation of SSM Session Manager
# sessions to any EC2 instance in this account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "ssm_session_doc" {
  # Allow the user to start a session
  statement {
    actions = [
      "ssm:SendCommand",
      "ssm:StartSession",
    ]
    resources = [
      "arn:aws:ec2:${var.aws_region}:${local.this_account_id}:instance/*",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartInteractiveCommand",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartNonInteractiveCommand",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartPortForwardingSession",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartPortForwardingSessionToSocket",
      "arn:aws:ssm:${var.aws_region}:${local.this_account_id}:document/SSM-SessionManagerRunShell",
    ]
    condition {
      test     = "BoolIfExists"
      variable = "ssm:SessionDocumentAccessCheck"
      values = [
        true,
      ]
    }
  }

  # Allow the user to read documents
  statement {
    actions = [
      "ssm:GetDocument",
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartInteractiveCommand",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartNonInteractiveCommand",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartPortForwardingSession",
      "arn:aws:ssm:${var.aws_region}::document/AWS-StartPortForwardingSessionToSocket",
      "arn:aws:ssm:${var.aws_region}:${local.this_account_id}:document/SSM-SessionManagerRunShell",
    ]
  }

  # Allow the user to collect some information
  statement {
    actions = [
      "ec2:DescribeInstances",
      "ssm:DescribeInstanceInformation",
      "ssm:DescribeInstanceProperties",
      "ssm:DescribeSessions",
      "ssm:GetConnectionStatus",
    ]
    resources = [
      "*",
    ]
  }

  # Allow the user to terminate his or her own sessions
  statement {
    actions = [
      "ssm:TerminateSession",
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${local.this_account_id}:session/&{aws:username}-*",
    ]
  }
}

resource "aws_iam_policy" "ssm_session_policy" {
  description = var.ssm_session_role_description
  name        = var.ssm_session_role_name
  policy      = data.aws_iam_policy_document.ssm_session_doc.json
}
