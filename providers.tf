# Configure the GitHub Provider
provider "github" {
	token        = "${var.github_token}"
	organization = "${var.github_organization}"
	//individual = false
}

provider "google" {
	  project = "juice-shop-project"
	  region  = "europe-west1"
	  credentials = var.credentials_file_path

}
