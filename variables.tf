variable "project_id" {
  description = "The id of the cloud project"
  type        = string
  default     = "prd"
}

variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-east-1"
}
