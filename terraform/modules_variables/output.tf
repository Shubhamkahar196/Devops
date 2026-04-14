# in value we need resource (aws_instance) and resource name (ec2)  
    # what is public_ip here at that time i am getting output of public_ip show i write public_ip
    # there many option what you want to get output
    output "public_ip_address" {
  value = module.ec2_instance.public_ip
}

output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}