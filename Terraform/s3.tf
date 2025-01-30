resource "aws_s3_bucket" "deepseek_bucket" {
  bucket = "deepseek-model-data"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}