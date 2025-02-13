# S3 Bucket Module

This module creates an S3 bucket with optional versioning and server-side encryption.

## Usage

```hcl
module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name       = "my-bucket"
  tags              = {
    Environment = "dev"
    Project     = "my-project"
  }
  versioning_enabled = true
  sse_algorithm      = "AES256"
}