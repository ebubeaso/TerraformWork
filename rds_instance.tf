# This will setup an RDS instance on AWS
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
# variables
variable storage {}
variable db_engine {}
variable protect_deletion {}
variable instance {}
variable db_name {}
variable db_username {}
variable db_password {}
variable max_storage {}
variable parameter_group {}
# make the resource (using the variables in the .tfvars file)
resource "aws_db_instance" "testdb" {
    allocated_storage = var.storage
    engine = var.db_engine
    deletion_protection = var.protect_deletion
    instance_class = var.instance
    name = var.db_name
    username = var.db_username
    password = var.db_password
    max_allocated_storage = var.max_storage
    parameter_group_name = var.parameter_group
    skip_final_snapshot = true
    tags = {Name = "RDSTest"}
}