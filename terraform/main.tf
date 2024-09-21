provider "aws" {
  region = var.region_name
}

module "security_groups" {
  source  = "./modules/security_group"
  vpc_id  = var.vpc_id
}

module "ec2_instance" {
  source              = "./modules/ec2"
  instance_type       = var.instance_type
  ami_id              = "ami-0e86e20dae9224db8"
  ssh_key_name        = "${var.project_name}-deployer-key"
  security_group_ids  = module.security_groups.security_group_ids
  user_data           = file("${path.module}/ansible_setup.sh")
}

resource "aws_key_pair" "deployer-key" {
  key_name   = "${var.project_name}-deployer-key"
  public_key = file(var.ssh_key_path)
}
