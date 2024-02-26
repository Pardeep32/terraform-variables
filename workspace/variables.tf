variable "instance_type" {
  type = map(any)
  default = {
    default = "t2.micro"
    dev     = "t2.small"
    prod    = "t2.medium"
  }
}

variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "ami" {
  type    = string
  default = "ami-0a2e7efb4257c0907"
}

variable "instance_count" {
    type = number
  default = 2
}
