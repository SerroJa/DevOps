variable "github_token"{
	description = " use key on local mashine"
	default = "~/.ssh/id_rsa.pub"
}
variable "credentials_file_path" {
	description = "1-st way"
	type = string
	default = "~/.gcloud/juice-shop-project-8f42062baada.json"
//"ubuntu.pub"
	
}