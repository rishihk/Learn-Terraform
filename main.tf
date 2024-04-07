# Part 2: Defining the services through resource blocks.
# Running terraform plan will show the changes that will be made to the infrastructure.
# Running terraform apply will apply the changes to the infrastructure.
# I am creating an S3 bucket on my aws console.
resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "my-terraform-s3-bucket-unique"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}