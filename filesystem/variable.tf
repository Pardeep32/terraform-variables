variable "aws_region" {
  default = "ca-central-1"
}

variable "ami_id" {
  default = "ami-0a2e7efb4257c0907"
  description = "this is ami id of ubuntu"
}

variable "instance_type" {
   type = string 
   default = "t2.micro"
}

variable "package_name"{
    description = "provide package_name that need to be installed with user data"
    type = string
    default = "httpd"
}
