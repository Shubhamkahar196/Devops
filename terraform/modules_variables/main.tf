provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./module/ec2_instance"
  ami_value = "ami-0b6c6ebed2801a5cb"
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-0ad5ed783b36cc7a8"
}

module "s3_bucket" {
    source="./module/s3"
    bucket_name = "shubham-devops-terraform-bucket-001"
}