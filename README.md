# session-manager-tf-module #

[![GitHub Build Status](https://github.com/cisagov/session-manager-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/session-manager-tf-module/actions)

A Terraform module for setting up and configuring logging for AWS
Session Manager access in an AWS account.  After applying this module
users can create the following types of sessions:

- Interactive command sessions
- Non-interactive command sessions
- Port forwarding sessions
- Port forwarding to socket sessions
- Shell sessions

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/session-manager-tf-module"
}
```

## Examples ##

- [Basic usage](https://github.com/cisagov/session-manager-tf-module/tree/develop/examples/basic_usage)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |
| random | ~> 3.1 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.ssm_sessions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.ssm_session_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ssm_session_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_session_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ssm_document.session_manager_preferences](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_session_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| cloudwatch\_log\_group\_name | The name of the log group into which session logs are to be uploaded. | `string` | `"/ssm/session-logs"` | no |
| cloudwatch\_log\_group\_retention | The number of days that SSM session logs will be retained in CloudWatch. | `number` | `365` | no |
| linux\_shell\_profile | The shell setup to run when connecting to a Linux instance.  Note that this string cannot be empty. | `string` | `"exec bash; cd"` | no |
| other\_accounts | A list of account IDs, each of which corresponds to an account to which access to the IAM role that allows creation of SSM Session Manager sessions to any EC2 instance in this account will be delegated. | `list(string)` | `[]` | no |
| ssm\_session\_role\_description | The description to associate with the IAM role (and policy) that allows creation of SSM Session Manager sessions to any EC2 instance in this account. | `string` | `"Allows creation of SSM Session Manager sessions to any EC2 instance in this account."` | no |
| ssm\_session\_role\_name | The name to assign the IAM role (and policy) that allows creation of SSM Session Manager sessions to any EC2 instance in this account. | `string` | `"StartStopSSMSession"` | no |
| windows\_shell\_profile | The shell setup to run when connecting to a Windows instance.  Note that this string cannot be empty. | `string` | `"date"` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| ssm\_document | The SSM document that can be used to create SSM Session Manager sessions in this account. |
| ssm\_session\_log\_group | The CloudWatch log group where SSM session logs will be stored. |
| ssm\_session\_role | The IAM role that allows creation of SSM Session Manager sessions to any EC2 instance in this account.  Users will assume this role in order to create sessions to EC2 instances. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## New Repositories from a Skeleton ##

Please see our [Project Setup guide](https://github.com/cisagov/development-guide/tree/develop/project_setup)
for step-by-step instructions on how to start a new repository from
a skeleton. This will save you time and effort when configuring a
new repository!

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
