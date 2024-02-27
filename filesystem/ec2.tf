terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

/*
# Fetch security group IDs
data "aws_security_group" "vpc_ssh" {
  name = "vpc-ssh-${terraform.workspace}"
}

data "aws_security_group" "web_vpc" {
  name = "web-vpc-${terraform.workspace}"
}
*/

resource "aws_instance" "my-instance1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  user_data              = templatefile("user_data.tmpl", { package_name = var.package_name })
  vpc_security_group_ids = [aws_security_group.vpc_shh.id, aws_security_group.web_vpc.id]
  tags = {
    "Name" = "terraformfxn-instance1"
  }
}


