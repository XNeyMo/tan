variable "instance_type" {}
variable "ami_id" {}
variable "ssh_key_name" {}
variable "security_group_ids" {}
variable "user_data" {}

resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.ssh_key_name
  user_data                   = var.user_data

  tags = {
    Name = "${var.project_name}-instance"
  }
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
