output "sample_role_arns" {
  value       = slice(aws_iam_role.minimal_roles[*].arn, 0, min(5, var.number_of_roles))
  description = "Sample of created role ARNs (first 5 or less)"
}

output "total_roles_created" {
  value       = length(aws_iam_role.minimal_roles)
  description = "Total number of roles created"
}

output "policy_arn" {
  value       = aws_iam_policy.minimal_permission_policy.arn
  description = "ARN of the created IAM policy"
}

output "policy_name" {
  value       = aws_iam_policy.minimal_permission_policy.name
  description = "Name of the created IAM policy"
}