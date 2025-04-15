provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

# Create KMS keys
resource "aws_kms_key" "application_keys" {
  count                   = var.number_of_keys
  description             = "${var.key_description_prefix} ${count.index + 1}"
  deletion_window_in_days = var.key_deletion_window_days
  enable_key_rotation     = var.enable_key_rotation
  
  # Key policy allowing the account to manage the key with minimal permissions
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Enable IAM User Permissions",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action   = "kms:*",
        Resource = "*"
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.key_name_prefix}-${count.index + 1}"
    }
  )
}

# Create aliases for the KMS keys for easier identification
resource "aws_kms_alias" "key_aliases" {
  count         = var.number_of_keys
  name          = "alias/${var.key_alias_prefix}-${count.index + 1}"
  target_key_id = aws_kms_key.application_keys[count.index].key_id
}