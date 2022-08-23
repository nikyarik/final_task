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
  key_name      = "aws-rsa-key-august-2022"
  user_data     = << EOF
#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
EOF
  tags = {
    Name = var.instance_name
  }
}

