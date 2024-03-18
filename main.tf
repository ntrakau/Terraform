terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
}

resource "aws_s3_bucket_acl" "d" {
    bucket = "DataSummit-NT-bucket"
    acl = "private"
}


resource "aws_s3_bucket_acl" "a" {
    bucket = "AdventureTech-NT-bucket"
    acl = "private"
}


resource "aws_s3_bucket_acl" "c" {
    bucket = "CodeCarnival-NT-bucket"
    acl    = "private"
}

output "instance_name" {
  value = aws_s3_bucket_acl.a.*.bucket
}
  