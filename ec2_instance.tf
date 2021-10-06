# This is my first terraform file
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
# make the AWS provider
provider aws {
    region = "us-east-1"
}
# Ubuntu Server 20.04 image (us-east-1) => ami-09e67e426f25ce0d7
# An example security group ID: sg-07dcea1f2fb8a0d0c
variable "ami_image" {
    type = string
    description = "The AMI to use to make the EC2 instance"
    default = "ami-0ab4d1e9cf9a1215a" # Amazon Linux 2 in the region us-east-1
}
variable "subnet" {
    type = string
    description = "The Subnet ID to put the instance in"
}
variable "key" {
    type = string
    description = "the AWS Key pair to use"
    default = "firstAWSInstance"
}
variable "sec_group" {
    type = string
    description = "The security group ID to use"
}
variable "tag_value" {
    type = map
    default = {"Name" = "Testing"}
}
# setup the resource
resource "aws_instance" "PierreTerraform" {
    ami = var.ami_image
    instance_type = "t2.micro"
    subnet_id = var.subnet
    key_name = var.key
    iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
    security_groups = [var.sec_group]
    tags = {Name = "TerraformTest"}
}