This project demonstrates how to set up a 3-tier infrastructure using Terraform, Jenkins, and Ansible. The infrastructure utilizes a load balancer that forwards requests to a private network where the server is running on an EC2 instance.

**Features**
*3-Tier infrastructure:* The project follows a 3-tier networking approach, with requests first passing through a load balancer and then forwarded to a private network where the server is running on an EC2 instance.
*Terraform:* The infrastructure is built using Terraform, which allows us to create, modify, and destroy infrastructure resources across multiple cloud providers.
*Jenkins:* A CI/CD pipeline is established using Jenkins. The Jenkinsfile will create the CI/CD for the 'nodeapp' on EC2.
*Ansible:* Ansible is used to manage configurations for the infrastructure. It will install Docker on all the machines and perform other necessary configurations.
*Automated inventory:* The inventory file is automated and generated dynamically by Ansible rather than manually giving info about the EC2 machines.
**Prerequisites**
AWS Account
AWS CLI
Terraform
Ansible
Jenkins
**Getting Started**
*Clone the repository:*
git clone https://github.com/your_username/3-tier-infra.git
*Navigate to the project directory:*
cd terraform
Update the variables in terraform.tfvars with your AWS credentials.
*Initialize the Terraform modules:*
terraform init
*Create the infrastructure:*
terraform apply
Once the infrastructure is created, update the hosts file in the ansible directory with the IP addresses of your EC2 instances.

*Run the Ansible playbook to install Docker on all the machines:*

ansible-playbook -i ansible/inventory.yaml ansible/docker.yaml
*Run the Ansible playbook to configure the server:*

ansible-playbook -i ansible/inventory.yaml 
Access the server at the public IP address of the load balancer.
**Conclusion**
This project provides a simple and easy-to-follow approach to set up a 3-tier infrastructure using Terraform, Jenkins, and Ansible. It can be used as a reference for similar projects and can be extended to add more features and functionali
