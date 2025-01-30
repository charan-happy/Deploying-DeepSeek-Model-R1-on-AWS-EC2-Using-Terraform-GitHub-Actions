variable "aws_region" {
  default = "us-west-2"
}

variable "ami_id" {
  default = "ami-00c257e12d6828491" # replace with your ami id 
}

variable "instance_type" {
  default = "g4dn.xlarge" #GPU instance type
}

variable "key_pair_name" {
  default = "deepseek-key"
}

variable "vpc_id" {
  default = "vpc-072176796ee4e7bb8"
}

variable "public_subnets" {
  default = ["subnet-078242d0d26a51ce9", "subnet-0525ade82fe64df93"]
}