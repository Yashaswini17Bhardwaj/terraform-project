terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-y"   
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "TerraformLock"   
  }
}

provider "aws" {
  region = var.aws_region
}
