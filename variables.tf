variable "github_token"{
	description = " used token to access github"
	default = "Cf3b52708680c9e09169f63219f93edff3d2d5d2"
}
variable.github_repository.develop.name{
	type = string	
	default = "test" // sho name sho default 
	//exemple = "test"
}

//variable "github_organization"{
//	type = string	
//	default = "DevOpsStudies"
//}
variable "credentials_file_path" {
	type = string
	description = "1-st way"
	default = "f:/././.gcloud/juice-shop-project-8f42062baada.json"
}
variable "instance_count" {
	default = 2	
}
#variable "allow_ports"{}