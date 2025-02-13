variable "bucket" {
  description = "The ID of the S3 bucket"
  type        = string
}

variable "events" {
  description = "A list of events to trigger the notification"
  type        = list(string)
  default = [ "s3:ObjectCreated:*" ]
}

variable "queue_arn" {
  description = "The ARN of the SQS queue to send notifications to"
  type        = string
}