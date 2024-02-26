resource "aws_instance" "first-instance" {
  instance_type = lookup(var.instance_type, terraform.workspace)
  ami           = var.ami
  count         = var.instance_count
  tags = {
    Name = "web-server-${terraform.workspace}"
  }
}

/*
resource "aws_instance" "first-instance" {
  for_each      = var.instance_type
  instance_type = each.value
  ami           = var.ami
  tags = {
    Name = "web-server-${terraform.workspace}-${each.key}"
  }
