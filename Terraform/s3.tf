resource "aws_s3_bucket" "deepseek_bucket" {
  bucket = "deepseek-model-data2"
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "deepseek_bucket_sse" {
  bucket = aws_s3_bucket.deepseek_bucket2.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}