
# Configure the GitHub Provider
provider "github" {
	token        = var.github_token
	organization = var.github_organization
}

provider "google" {
  project = "project-4-vm"
  region  = "europe-west1"
  credentials = var.credentials_file_path

}