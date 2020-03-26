variable "github_token"{
	description = " used token to access github"
	token = "Cf3b52708680c9e09169f63219f93edff3d2d5d2"
}
variable "github_organization"{
	type = string	
	name = "DevOpsStudies"
}
variable "credentials_file_path" {
	type = string
	description = "1-st way"
	default = "f:/DevOps/Terraform/.gcloud/juice-shop-project-8f42062baada.json"
}
variable "instance_count" {
	default = 2	
}
#variable "allow_ports"{}