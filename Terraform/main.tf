terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# EC2 instance with GPU support
resource "aws_instance" "deepseekmodel" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_pair_name
  iam_instance_profile = aws_iam_instance_profile.deepseek_profile.name
  security_groups      = [aws_security_group.deepseek_sg.name]

  # User data script to install Docker and deploy the model
  user_data = file("user-data.sh")

  tags = {
    Name = "Deepseek-Model-R1"
  }
}

# IAM role and instance profile
resource "aws_iam_role" "deepseek_role" {
  name_prefix = "deepseek-role-"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "deepseek_profile" {
  name_prefix = "deepseek-profile-"
  role        = aws_iam_role.deepseek_role.name
}

# Attach Policies to IAM Role
resource "aws_iam_role_policy" "deepseek_policy" {
  name_prefix = "deepseek-policy-"
  role        = aws_iam_role.deepseek_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::deepseek-model-data/*"
      }
    ]
  })
}