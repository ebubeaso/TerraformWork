# This script will be used to make a new queue in SQS
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
# make your SQS variables
variable queue_name {
    type = string
    description = "The name of the SQS queue"
}
variable timeout {
    type = number
    description = "How long you want the queue to remain visible"
    default = 30
}
variable retention {
    type = number
    description = "How long would you like to retain the message in queue"
    default = 43200
}
variable delay {
    type = number
    description = "How long (in seconds) a message will be delayed"
    default = 0
}
# set up the script to configure the queue
resource "aws_sqs_queue" "EbubeTestQueue1" {
    name = var.queue_name
    visibility_timeout_seconds = var.timeout
    message_retention_seconds = var.retention
    delay_seconds = var.delay
    tags = {"Queue Attempt": "First Attempt"}
}