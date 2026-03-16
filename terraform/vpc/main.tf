terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.33.0"
        }
    }
}
provider "aws" {
    region = "us-east-1"
}
resource "aws_vpc" "example" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "vpc1"
    }
}
resource "aws_subnet" "example" {
    vpc_id     = aws_vpc.example.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "subnet1"
    }
}
resource "aws_internet_gateway" "example" {
    vpc_id = aws_vpc.example.id
    tags = {
        Name = "igw1"
    }
}
resource "aws_route_table" "example" {
    vpc_id = aws_vpc.example.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.example.id
    }
    tags = {
        Name = "main"
    }
}
resource "aws_route_table_association" "main" {
    subnet_id      = aws_subnet.example.id
    route_table_id = aws_route_table.example.id
}


# creating instance
 resource "aws_instance" "example" {
    ami = "ami-0b6c6ebed2801a5cb"
    instance_type = "t2.micro"
    
    subnet_id = aws_subnet.example.id
 }

#  output "instance_name" {
   
#  }