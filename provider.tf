# Part 1: create the required_providers, provider block. (terraform init will download the provider plugin)

# Step 1: create the terraform required_providers block which specifies the required provider and its version.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Step 2: create the provider block which specifies the provider configuration.
provider "aws" {
  region = "us-east-1"
  profile = "terraform"
}

