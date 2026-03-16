


provider "aws" {
  region = "us-east-1"
}

# aws_instance - to create instance repository
# ec2 here is name of instance you can give any things
resource "aws_instance" "ec2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id_value
}