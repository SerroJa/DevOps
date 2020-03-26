variable "github_token"{
	description = " used token to access github"
	default = "Cf3b52708680c9e09169f63219f93edff3d2d5d2"
}
variable "credentials_file_path" {
	description = "1-st way"
	type = string
	default = "f:/DevOps/Terraform/.gcloud/juice-shop-project-8f42062baada.json"
}
variable "instance_count" {
	default = 2	
}