provider "aws" {
  region = "us-east-1" 
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { 
    Name = "terraform-vpc"
  }
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "demo-terraform-bucket-practise1" 
  
}

resource "aws_instance" "demo_instance" {
  ami             = "ami-080e1f13689e07408" 
  instance_type   = "t2.micro"
  key_name        = "jenkins" 
  security_groups = ["default"] 

  tags = {
    Name = "demo1-tf"
  }
}
