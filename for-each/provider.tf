terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "mys3bucket-remote-state"
    key = "foreach-demo"
    region = "us-east-1"
    dynamodb_table = "demo-table-locking"
  }
}