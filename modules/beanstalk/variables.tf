variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "solution_stack" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ec2_instance_profile_name" {
  type = string
}

variable "service_role_arn" {
  type = string
}
