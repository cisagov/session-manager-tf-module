# session-manager-tf-module #

[![GitHub Build Status](https://github.com/cisagov/session-manager-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/session-manager-tf-module/actions)

A Terraform module for setting up and configuring logging for AWS
Session Manager access in an AWS account.

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
| random | ~> 3.1 |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| session-manager-settings | gazoakley/session-manager-settings/aws | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.ssm_sessions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.ssmsession_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ssmsession_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssmsession_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.ssm_sessions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.ssm_sessions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [random_id.bucket](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssmsession_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| cloudwatch\_log\_group\_name | The name of the log group into which session logs are to be uploaded. | `string` | `"/ssm/session-logs"` | no |
| cloudwatch\_log\_group\_retention | The number of days that SSM session logs will be retained in CloudWatch. | `number` | `365` | no |
| other\_accounts | A list of account IDs, each of which corresponds to an account to which access to the IAM role that allows creation of SSM SessionManager sessions to any EC2 instance in this account will be delegated. | `list(string)` | `[]` | no |
| s3\_bucket\_name\_prefix | The prefix of the name of the S3 bucket in which session logs are to be stored.  A random string will be appended to this prefix in order to create a unique S3 bucket name. | `string` | `"ssm-session-logs-"` | no |
| ssmsession\_role\_description | The description to associate with the IAM role (and policy) that allows creation of SSM SessionManager sessions to any EC2 instance in this account. | `string` | `"Allows creation of SSM SessionManager sessions to any EC2 instance in this account."` | no |
| ssmsession\_role\_name | The name to assign the IAM role (and policy) that allows creation of SSM SessionManager sessions to any EC2 instance in this account. | `string` | `"StartStopSSMSession"` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| ssm\_document\_arn | ARN of the SSM document that can be used to create SSM SessionManager session in this account. |
| ssm\_document\_name | Name of the SSM document that can be used to create SSM SessionManager session in this account. |
| ssm\_session\_bucket | The S3 bucket where SSM session logs will be stored. |
| ssm\_session\_log\_group | The CloudWatch log group where SSM session logs will be stored. |

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
