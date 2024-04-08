# Variables are defined in order to make the module more flexible and reusable.
# All arguments are optional
# Their values are set in a .tfvars, and if not, value is asked during the terraform apply in the CLI.

variable "subnet1_cidr" {
  description = "The CIDR block for the first subnet"
  type        = string
  default     = "" 
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # uses default value if not set in .tfvars
}