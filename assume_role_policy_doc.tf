# ------------------------------------------------------------------------------
# Create an IAM policy document that delegates access to this role to
# other accounts.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    principals {
      type        = "AWS"
      identifiers = var.other_accounts
    }
  }
}
