output "sqs_id" {
  description = "The ID of the SQS queue"
  value       = aws_sqs_queue.main.id
}

output "sqs_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.main.arn
}