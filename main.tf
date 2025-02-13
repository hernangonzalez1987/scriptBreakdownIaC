provider "aws" {

  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = var.region

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
      s3             = "http://s3.localhost.localstack.cloud:4566"
      sns            = "http://localhost:4566"
      sqs            = "http://localhost:4566"
  }
}

module "aws_s3_scripts_bucket" {
  source = "./modules/aws_s3_bucket"

  bucket_name       = "scripts"
  tags              = {
    Environment = terraform.workspace
  }
  versioning_enabled = false
  sse_algorithm      = "AES256"
}

module "aws_s3_breakdowns_bucket" {
  source = "./modules/aws_s3_bucket"

  bucket_name       = "breakdowns"
  tags              = {
    Environment = terraform.workspace
  }
  versioning_enabled = false
  sse_algorithm      = "AES256"
}

module "aws_sqs" {
  source = "./modules/aws_sqs"

  queue_name_deadletter = "breakdown-events-queue-deadletter"
  queue_name            = "breakdown-events-queue"
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "sqs:SendMessage",
        "Resource": "arn:aws:sqs:*:*:breakdown-events-queue",
        "Condition": {
          "ArnEquals": {
           "aws:SourceArn":     
              "${module.aws_s3_scripts_bucket.bucket_arn}" 
           }
        }
      }
    ]
  }
  POLICY
}

module "aws_scripts_notification" {
  source = "./modules/aws_s3_bucket_notification"

  bucket = module.aws_s3_scripts_bucket.bucket_id
  events = ["s3:ObjectCreated:*"]
  queue_arn = module.aws_sqs.sqs_arn
}
