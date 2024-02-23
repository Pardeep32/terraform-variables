### ec2 creation using for each (set of strings)
variable "instance_types" {
  type    = set(string)
  default = ["t2.micro", "t2.medium", "t2.small"]
}

variable "ami" {
  type    = set(string)
  default = ["ami-0156b61643fdfee5c", "ami-0a2e7efb4257c0907", "ami-0a2e7efb4257c0907"]
}

variable "security_groups" {
  type    = set(string)
  default = ["sg-01276740319f5e0fc", "sg-022f51287481b76dd", "sg-0ffa6d3eb6eb37f38"]
}

resource "aws_instance" "my_instances" {
  for_each = var.instance_types

  ami           = element(var.ami, index(var.instance_types, each.key))
  instance_type = each.key
  security_groups = [element(var.security_groups, index(var.instance_types, each.key))]

  tags = {
    Name = each.key
  }
}
