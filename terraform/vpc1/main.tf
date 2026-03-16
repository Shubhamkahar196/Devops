terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 6.34.0"
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
resource "aws_subnet" "main" {
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

#   creating private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch =false
  tags = {
    Name = "private-subnet"
    Environment = "dev"
    Terraform = "true"
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
resource "aws_route_table" "main" {
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
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Create Security Group for Public Access
resource "aws_security_group" "main" {
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
# Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.main.id
}
output "security_group_id" {
  description = "ID of the public security group"
  value       = aws_security_group.main.id
}
# Create EC2 Instance
resource "aws_instance" "main" {
    ami           = "ami-0f3caa1cf4417e51b" # Amazon Linux 2 AMI (us-east-1)
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.main.id
    vpc_security_group_ids = [aws_security_group.main.id]
    # key_name      = "lakhkey"
    associate_public_ip_address = true
    tags = {
        Name        = "main-ec2"
        Environment = "dev"
        Terraform   = "true"
    }
}
output "ec2_instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.main.id
}
output "ec2_public_ip" {
    description = "Public IP of the EC2 instance"
    value       = aws_instance.main.public_ip
}



# for private
resource "aws_instance" "private" {
    ami           = "ami-0f3caa1cf4417e51b" # Amazon Linux 2 AMI (us-east-1)
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.private.id
    vpc_security_group_ids = [aws_security_group.main.id]
    # key_name      = "lakhkey"
    associate_public_ip_address = false
    tags = {
        Name        = "private-ec2"
        Environment = "dev"
        Terraform   = "true"
    }
}
# output "ec2_instance_id" {
#     description = "ID of the EC2 instance"
#     value       = aws_instance.private.id
# }
# output "ec2_public_ip" {
#     description = "Public IP of the EC2 instance"
#     value       = aws_instance.private.public_ip
# }
