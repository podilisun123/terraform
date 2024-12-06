terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.78.0"
    }
  }
  backend "s3" {
    bucket = "sundar-remotestate" 
    key    = "expense-key"
    region = "us-east-1"
    dynamodb_table = "state-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}