variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = "AES256"
}