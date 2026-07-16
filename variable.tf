variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ec2_default_root_storage_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 10
}

variable "ec2_ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
  default     = "ami-01a00762f46d584a1"
}

variable "env" {
  default = "dev"
  type = string
}