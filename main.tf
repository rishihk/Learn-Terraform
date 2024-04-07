# Part 2: Defining the services through resource blocks.
# Running terraform plan will show the changes that will be made to the infrastructure.
# Running terraform apply will apply the changes to the infrastructure.
# Running terraform destroy will destroy the infrastructure.
# I am creating an S3 bucket on my aws console.

# Syntax explanation: resource "specify the resource provider" "name of the resource locally for terraform to reference { actual name of the resource on aws. tags { which are metadata for our resource.}} tags allow us to organize our resources and provide additional information about them.

resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "my-terraform-s3-bucket-unique"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Now we want to create the aws cloudwatch log stream.
# Step 1: Create the log group: collection contaainer for log streams that share the same retention, monitoring, and access control settings.
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
