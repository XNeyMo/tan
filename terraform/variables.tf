variable "ssh_key_path" {
  description = "Path to the SSH public key"
}

variable "project_name" {
  description = "Name of the project"
}

variable "region_name" {
  description = "AWS region to deploy the resources"
}

variable "vpc_id" {
  description = "ID of the VPC where resources will be created"
}

variable "instance_type" {
  description = "Type of the EC2 instance"
}
