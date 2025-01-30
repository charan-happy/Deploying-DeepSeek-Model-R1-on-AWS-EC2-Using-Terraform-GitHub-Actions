variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-04b4f1a9cf54c11d0" # replace with your ami id 
}

variable "instance_type" {
  default = "g4dn.large" #GPU instance type
}

variable "key_pair_name" {
  default = "deepseek-key"
}

variable "vpc_id" {
  default = "vpc-0ebdbf4bfda1aaff5"
}

variable "public_subnets" {
  default = ["subnet-03adae12ba0076b25", "subnet-03c9b780f8a8b6cad"]
}