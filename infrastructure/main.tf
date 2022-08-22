terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {

  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c956e207f9d113d5"
  instance_type = "t2.micro"
  count         = 1
  key_name      = "aws-rsa-key-august-2022"
  tags = {
    Name = var.instance_name
  }
}

