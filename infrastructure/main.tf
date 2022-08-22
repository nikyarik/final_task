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

resource "aws_key_pair" "deployer" {
  key_name   = "aws-rsa-key-august-2022"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKJ9GRnFzABDnMc7na1wv7Au+sQsHill1NcqZw8b6x3AbnIfr6lgetv3CDEo77xAiA2jK+spD0azt6fU8rsoAC6ugFuJBRfacL7MrSjWZ7N5mIIj5WXsYD3pAa2+tjIYt4dZvwG/id0pPdEkcFAHqw3WxPh+AX+XArIxuM4txAjGHYWLnWRo4eYT3gQUkOdxFzeHKBMvhfJmZ+B8sqT2pGgblTP1dd4EYUXkw9EfD2/KPkweYA+5WL7Ov1Dc9ph7Yw6LmTTBYb5kjh6CUeoFYPg88/V7bXz9CcSxq2nIE+DVojWagL+EKWIDQ2HfibRjTMLFr3b8s53Cgjg1iDW1Kl”
}
