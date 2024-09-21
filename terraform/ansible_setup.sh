#!usr/bin/env bash
set -euxo pipefail

# Log output for debugging
exec > /var/log/user-data.log 2>&1

# Update package list and install necessary packages in one go
sudo apt-get update && sudo apt-get install -y git python3-pip ansible

# Clone the GitHub repository and run the Ansible playbook
git clone https://github.com/XNeyMo/tan
cd tan/ansible
mv configs/inventory /etc/ansible/hosts
ansible-playbook playbooks/nginx_install.yaml -i /etc/ansible/hosts -e "env=development"
ansible-playbook playbooks/nginx_config.yaml -i /etc/ansible/hosts -e "env=development"
ansible-playbook playbooks/php_setup.yaml -i /etc/ansible/hosts -e "env=development"
