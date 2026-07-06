variable "ec2_instance_type" {
    type = string
    default = "t3.small"
}

variable "ec2_root_storage_size"{
    type = number
    default = 25
}

variable "ec2_ami_id" {
    type = string
    default = "ami-01a00762f46d584a1"
}