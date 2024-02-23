terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0a2e7efb4257c0907"
}

variable "instance_type" {
  default = "t2.micro"
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "instance1" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  availability_zone = "ca-central-1"

  tags = {
    name = "first"
  }
}
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "security_group1" {
  name        = "security-group"
  description = "Security group for instance"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_instance.instance1]
}
