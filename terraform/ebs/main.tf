terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.34.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name        = "main-vpc"
    Environment = "dev"
    Terraform   = "true"
  }
}
# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "public-subnet"
    Environment = "dev"
    Terraform   = "true"
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "main-igw"
    Environment = "dev"
    Terraform   = "true"
  }
}
# Create Route Table for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name        = "public-rt"
    Environment = "dev"
    Terraform   = "true"
  }
}
# Associate Public Subnet with Route Table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
# Create Security Group for Public Access
resource "aws_security_group" "public" {
  name        = "public-sg"
  description = "Allow HTTP, HTTPS, and SSH inbound traffic"
  vpc_id      = aws_vpc.main.id
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "public-sg"
    Environment = "dev"
    Terraform   = "true"
  }
}
resource "aws_instance" "example" {
  ami                         = "ami-0360c520857e3138f" # Amazon Linux 2 AMI in us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public.id]
  associate_public_ip_address = true
  key_name                    = "key25" # Replace with your key pair name
  tags = {
    Name        = "example-instance"
    Environment = "dev"
    Terraform   = "true"
  }
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 2
  tags = {
    Name        = "example-volume"
    Environment = "dev"
    Terraform   = "true"
  }
}
resource "aws_volume_attachment" "example" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}
# Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}
output "security_group_id" {
  description = "ID of the public security group"
  value       = aws_security_group.public.id
}
