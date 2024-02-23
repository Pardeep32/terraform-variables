
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



## create s3 bucket with for each 
resource "aws_s3_bucket" "terraform-bucket" {
  for_each = {
    "dev"   = "dev-s3-bucket-deep1717"
    "stage" = "stage-s3-bucket-deep1818"
    "prod"  = "prod-s3-bucket-deep1919"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"
  tags = {
    value          = each.value
    env            = each.key
    s3-bucket-name = "${each.key}-${each.value}"
  }
}

