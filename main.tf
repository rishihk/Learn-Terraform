# Part 2: Defining the services through resource blocks.

# Create s3 bucket for backend state file storage.
# Remember, when switching from local backend to remote backend, first create the s3 bucket for the backend state file storage, run terraform apply, then set the backend config on top, terra init, and apply.
resource "aws_s3_bucket" "state-bucket" {
  bucket = "my-terra-state-bucket-3030"

  tags = {
    Name        = "My bucket"
  }
}

# Create an S3 bucket for user purpose on my aws console.
# Syntax explanation: resource "specify the resource provider_required resource" "name of the resource locally for terraform to reference { actual name of the resource on aws. tags { which are metadata for our resource.}} tags allow us to organize our resources and provide additional information(metadata) about them.

resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "my-terraform-s3-bucket-unique"

  tags = {
    Name        = "My bucket"
  }
}

# Now we want to create the aws cloudwatch log stream.
# Step 1: Create the log group: collection container for log streams that share the same retention, monitoring, and access control settings.
resource "aws_cloudwatch_log_group" "terra-log-group"{
    name = "terraform-log-group-rishi"
    retention_in_days = 30

    tags = {
      Name        = "My log group"
      Environment = "Dev"
    }
}

# Step 2: Create the log stream: sequence of log events that share the same source.
resource "aws_cloudwatch_log_stream" "terra-log-stream"{
    name = "terra-log-stream-rishi"
    log_group_name = aws_cloudwatch_log_group.terra-log-group.name # reference the log group name from the log group resource.
}

# Create an EC2 instance.
resource "aws_instance" "terra-instance" {
  ami           = "ami-080e1f13689e07408" # must be region-specific! 
  instance_type = "t2.micro"

  tags = {
    Name = "terra-instance"
  }
}

# this will output the instance type of the instance that we created when we run terraform apply.
# the .instance_type can be replaced with anything we see when we run terraform state show aws_instance
output "instance-type"{ 
  value = aws_instance.terra-instance.instance_type
}

# A virtual private cloud is a virtual section of the cloud that is logically isolated from other virtual networks in the cloud.
resource "aws_vpc" "terra-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devl"
  }
}



