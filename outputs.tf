output "sample_key_ids" {
  value       = slice(aws_kms_key.application_keys[*].key_id, 0, min(5, var.number_of_keys))
  description = "Sample of created KMS key IDs (first 5 or less)"
}

output "sample_key_arns" {
  value       = slice(aws_kms_key.application_keys[*].arn, 0, min(5, var.number_of_keys))
  description = "Sample of created KMS key ARNs (first 5 or less)"
}

output "sample_key_aliases" {
  value       = slice(aws_kms_alias.key_aliases[*].name, 0, min(5, var.number_of_keys))
  description = "Sample of created KMS key aliases (first 5 or less)"
}

output "total_keys_created" {
  value       = length(aws_kms_key.application_keys)
  description = "Total number of KMS keys created"
}