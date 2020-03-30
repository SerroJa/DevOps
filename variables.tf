variable "github_token" {
	description = " used token to access github"
	default = "037132ccd074f2fadf725a5f327402a26e53cb07"
}

variable "github_organization" {
	type = string	
	default = "DevOpsStudies"
}
variable "credentials_file_path" {
	type = string
	description = "1-st way"
	default = "f:/DevOps/Terraform/.gcloud/juice-shop-project-8f42062baada.json"
}
variable "machine_for_project" {
	type = string
	default = "tf-project"
}
variable "instance_count" {
	default = "1"	
}
variable "network_place" {
	type = string
	default = "my-network-1-tf"
}
//variable "allow_ports"{}