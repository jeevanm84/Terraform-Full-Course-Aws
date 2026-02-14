terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "my-project"
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "jeevan-demo-bucket-123456" // Change to a unique name
}