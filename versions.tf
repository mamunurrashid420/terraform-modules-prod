terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
<<<<<<< HEAD
=======

  # Optional but recommended: remote state (S3 + DynamoDB lock)
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "envs/dev/terraform.tfstate"
  #   region         = "ap-southeast-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
>>>>>>> b58dcd0 ( nodejs update)
}

provider "aws" {
  region = var.aws_region
}
