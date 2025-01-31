output "instance_public_ip" {  
  value = aws_instance.deepseekmodel.public_ip  
}  

output "alb_dns_name" {  
  value = length(aws_lb.deepseek_alb) > 0 ? aws_lb.deepseek_alb[0].dns_name : "ALB not created"  
}  

output "s3_bucket_name" {  
  value = length(aws_s3_bucket.deepseek_bucket) > 0 ? aws_s3_bucket.deepseek_bucket[0].id : "Bucket not created"  
}  