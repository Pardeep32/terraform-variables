resource "aws_instance" "instance" {
  count = var.instance_count

  ami = var.ami_id
  //instance_type = var.instance_type
  //  instance_type = var.instance_type[1]
  instance_type = var.instance_type["dev"]
  

  tags ={
    Name = "instance-${count.index}"
  }

}

/*
resource "aws_instance" "instance1" {
  ami = var.ami_id
  instance_type = var.instance_type
}

resource "aws_instance" "instance2" {
  ami = var.ami_id
  instance_type = var.instance_type
}

resource "aws_instance" "instance3" {
  ami = var.ami_id
  instance_type = var.instance_type
}  */