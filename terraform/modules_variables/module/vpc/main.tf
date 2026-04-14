resource "aws_vpc" "learning_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name= var.vpc_name
  }
}