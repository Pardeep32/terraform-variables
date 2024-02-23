
variable "instance_types" {
  type = map
  default = {
    "dev"  = "t2.micro"
    "test" = "t2.medium"
    "prod" = "t2.small"
  }
}

variable "ami" {
  type = map
  default = {
    "dev"  = "ami-0156b61643fdfee5c"  # Linux
    "test" = "ami-0a2e7efb4257c0907"  # Ubuntu
    "prod" = "ami-0a2e7efb4257c0907"  # Ubuntu
  }
}

variable "security_groups" {
  type = map
  default = {
    "t2.micro"  = "sg-01276740319f5e0fc"
    "t2.medium" = "sg-022f51287481b76dd"
    "t2.small"  = "sg-0ffa6d3eb6eb37f38"
  }
}

###### instance creating using for each map ######

resource "aws_instance" "my_instances" {
  for_each = var.instance_types

  ami           = var.ami[each.key]
  instance_type = each.value
  // security_groups = [lookup(var.security_groups, each.value)]  # Use lookup to get the security group ID

  tags = {
    Name = each.key
  }
}

### iam user create by for_each map
variable "iam_users" {
  type = map
  default = {
    "deeppp" = {}
    "kamal" = {}
    "nanu" = {}
  }
}


