resource "aws_s3_bucket_notification" "this" {
  bucket = var.bucket

  queue {
    events = var.events
    queue_arn = var.queue_arn
  }
}
