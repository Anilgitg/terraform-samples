terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "mys3bucket-remote-state"
    key = "demo-state-remote"
    region = "us-east-1"
    dynamodb_table = "demo-table-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}