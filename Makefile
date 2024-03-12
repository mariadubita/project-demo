eastus-destroy:
		terraform workspace new  eastus  || terraform workspace select  eastus
		terraform init
		terraform destroy -var-file envs/eastus.tfvars -auto-approve

