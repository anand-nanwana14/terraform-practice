# Define variables
variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

locals {
  subnet_names = [
    for az in var.availability_zones : "${var.region}-subnet-${az}"
  ]
}

output "subnet_names" {
  value = local.subnet_names
}
