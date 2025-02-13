variable "queue_name_deadletter" {
  description = "The name of the deadletter SQS queue"
  type        = string
}

variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "max_receive_count" {
  description = "The maximum number of times a message can be received before being sent to the deadletter queue"
  type        = number
  default     = 10
}

variable "policy" {
  description = "The policy of the SQS queue"
  type        = string
  default =  ""
}