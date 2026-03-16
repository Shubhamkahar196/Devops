# in value we need resource (aws_instance) and resource name (ec2)  
    # what is public_ip here at that time i am getting output of public_ip show i write public_ip
    # there many option what you want to get output
output "public_ip_address" {  
  value = aws_instance.ec2.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}