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
  ami           = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  key_name      = "aws-rsa-key-august-2022"
  user_data     = "${file("install_apache.sh")}"
  tags = {
    Name = var.instance_name
  }
}

