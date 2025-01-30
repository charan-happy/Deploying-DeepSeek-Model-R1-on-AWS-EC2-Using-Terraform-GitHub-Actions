output "instance_public_ip" {
  value = aws_instance.deepseekmodel.public_ip
}

output "alb_dns_name" {
  value = aws_lb.deepseek_alb.dns_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.deepseek_bucket
}

