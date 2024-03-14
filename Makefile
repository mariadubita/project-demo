eastus:
		terraform workspace new  eastus  || terraform workspace select  eastus
		terraform init  
		terraform apply -var-file envs/eastus.tfvars -auto-approve

all:
	make eastus

eastus-destroy:
		terraform workspace new  eastus  || terraform workspace select  eastus
		terraform init
		terraform destroy -var-file envs/eastus.tfvars -auto-approve

destroy-all:
	make destroy-eastus