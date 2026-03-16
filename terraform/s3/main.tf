# terrafrom-block 

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.32.1"
    }
  }
}

# provider block
# here you can add your secret key here
provider "aws" {
    
  # Configuration options
}



# resources block


resource "aws_s3_bucket" "my_bucket" {
  bucket = "mys3bucket324-23"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Production"
  }
}



# instance

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "6.32.1"
#     }
#   }
# }

# provider "aws" {
#   # Configuration options
#   region = "us-east-1"
# }


# resource "aws_instance" "example" {
#    ami = "ami-0b6c6ebed2801a5cb"
#   instance_type = "t3.micro"
   

#   tags = {
#     Name = "HelloWorld"
#   }
# }

  # versioning

  resource "aws_s3_bucket_versioning" "example" {
    bucket ="aws_s3_bucket.example.id"

    versioning_configuration {
      status = "Enabled"
    }
    
  }