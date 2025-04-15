provider "aws" {
  region = var.aws_region
}

# Create IAM roles with minimum permissions
resource "aws_iam_role" "minimal_roles" {
  count = var.number_of_roles
  
  name = "${var.role_name_prefix}-${count.index + 1}"
  
  # Assume role policy (trust relationship)
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.assume_role_service
        }
      }
    ]
  })
  
  # Tags for better organization
  tags = merge(
    var.common_tags,
    {
      Name = "${var.role_name_prefix}-${count.index + 1}"
    }
  )
}

# Create a minimal permission policy
resource "aws_iam_policy" "minimal_permission_policy" {
  name        = var.policy_name
  description = var.policy_description
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.allowed_actions
        Effect   = "Allow"
        Resource = var.allowed_resources
      }
    ]
  })
}

# Attach the policy to all roles
resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count      = var.number_of_roles
  role       = aws_iam_role.minimal_roles[count.index].name
  policy_arn = aws_iam_policy.minimal_permission_policy.arn
}