variable "aws_region" {
  default = "ca-central-1"
}

variable "ami_id" {
  default = "ami-0a2e7efb4257c0907"
  description = "this is ami id of ubuntu"
}

variable "instance_type" {
   // type = string 
  // default = "t2.micro"

  /* variable type as list

   type = list(string)
   default = ["t3.medium","t2.micro","t2.large"]
   instance_type = var.instance_type[1] => t2.micro

  */


   // variable type as map
  type = map(string)
  default = {
    dev = "t2.small",
    prod = "t2.medium"
    test = "t2.nano"
    }

    // instance_type = var.instance_type["dev"] => t2.small

}

variable "instance_count" {
  type =  number
  default = 3
}

// terraform plan -var="instance_type=t2.nano" -var="instance_count=1" -out plan1.paln
// terraform apply  "plan1.plan"