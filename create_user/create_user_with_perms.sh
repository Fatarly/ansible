#!/bin/bash

echo "Create 'ansible' user as sis"
read -n1 -r -p "Press any key to continue.." key

ansible-playbook user.yml -i inventory.ini -s -k --ask-sudo-pass

echo "Addig nopass sudo to 'ansible' as sis"
read -n1 -r -p "Press any key to continue.." key

ansible-playbook perm.yml -i inventory.ini -s -k --ask-sudo-pass

echo "Addig ssh key for 'ansible' user as ansible ( Default pass: asd123 )"
read -n1 -r -p "Press any key to continue.." key

ansible-playbook ssh_key.yml -i inventory.ini -k

echo "Delete 'ansible' user password as ansible ( No pass )"
read -n1 -r -p "Press any key to continue.." key

ansible-playbook delete_ansible_pass.yml -i inventory.ini -s
