variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type    = string
  default = ""
}

variable "instance_profile_name" {
  type    = string
  default = null
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH to the EC2 instance; use your public IP with /32"
  type        = list(string)
  default     = []
}
