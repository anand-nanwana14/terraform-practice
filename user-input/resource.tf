# input variables
variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "key_name" {
    type = string
  
}

provider "aws" {
  region = "us-east-1" 
}

resource "aws_s3_bucket" "terra_bucket" {
  bucket = var.bucket_name
}

resource "aws_instance" "terra_instance" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = ["default"] 

  tags = {
    Name = "my-instance" 
  }
}
