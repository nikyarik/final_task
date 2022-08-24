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
  vpc_security_group_ids = [aws_security_group.sg-tcp-ports.id]
  tags = {
    Name  = var.instance_name
    BU    = ITEA
    Owner = yarik
  }
}

resource "aws_security_group" "sg-tcp-ports" {
  name = “sec-group-tcp-ports”
  description = "Allow HTTP(S),SSH,8080,8888 traffic via Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
