# This Terraform file will create a new S3 bucket for me to use for AWS cloudfront
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}
# Set up the provider
provider aws {
    region = "us-east-1"
}
# setup some S3 variables
variable "bucket_name" {
    type = string
    description = "The name of the S3 bucket that you are making"
}
variable tag {
    type = map(string)
    description = "The AWS tags that you would give to this bucket"
}
# Setup the resource (S3)
resource "aws_s3_bucket" "ebube-cloudfront-test1" {
    bucket = var.bucket_name
    acl = "public-read"
    website {
        index_document = "index.html"
        error_document = "error.html"
    }
    tags = var.tag
}