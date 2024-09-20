terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "mys3bucket-remote-state"
    region = "us-east-1"
    key = "remote-state-demo"
    dynamodb_table = "demo-table-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}