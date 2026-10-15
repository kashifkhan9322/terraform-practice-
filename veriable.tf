variable "vpc_id" {
  description = "Existing VPC ID in us-east-1"
  type        = string
}

variable "public_subnet_ids" {
  description = "Two public subnet IDs in different Availability Zones"
  type        = list(string)
}
