# ------------------------------------------------------------------------------
# Provision the S3 bucket where the SSM session logs will be stored.
# ------------------------------------------------------------------------------

resource "random_id" "bucket" {
  # Each pair of digits in the hex representation is one byte, and the
  # maximum length of an S3 bucket name is 63 characters, so this is
  # the number of random bytes we need.
  byte_length = floor((63 - length(var.s3_bucket_name_prefix)) / 2)
}

resource "aws_s3_bucket" "ssm_sessions" {
  bucket = "${var.s3_bucket_name_prefix}${random_id.bucket.hex}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }
}

# This blocks ANY public access to the bucket or the objects it
# contains, even if misconfigured to allow public access.
resource "aws_s3_bucket_public_access_block" "ssm_sessions" {
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = aws_s3_bucket.ssm_sessions.id
  ignore_public_acls      = true
  restrict_public_buckets = true
}
