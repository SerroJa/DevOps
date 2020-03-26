resource "github_repository" "develop" {
	name = "develop"
       // organisation = " DevOpsStudies"
 	description  = "MyRepoForPracticeDevs"
//token       = var.github_token
    private = true
}
resource "github_branch_protection" "develop" {
	  repository     = "develop"
	  branch         = "master"
	  enforce_admins = true
	
	required_status_checks {
		strict = false
		contexts = ["ci/travis"]
	}
//git config branch.master.pushRemote no_push
//enable_branch_restrictions = true
}


provider "google" {
  project = "project-4-vm"
  region  = "europe-west1"
  credentials = var.credentials_file_path

}
	
resource "google_compute_instance" "project-4-vm"{
	name = "tf-project-4-vm"
	count         = var.instance_count
						//project = google_project.service_project_4.project_id
	machine_type = "n1-standard-1"
	zone = "europe-west1-b"
 boot_disk {	
	initialize_params {	
	  image = "ubuntu-1604-lts"
 	}
 }
 network_interface {
	network = "default"
	//network = google_compute_network.fwrule.network

	access_config {
	   //Ephemeral ip
  	}
 }
} 
resource "google_compute_firewall" "default" {
    name    = "allow-ssh-and-icmp" 
    network = google_compute_network.default.name

//project = google_compute_network.network.project

	  allow {
	    protocol = "icmp, tcp"
	    ports    = [ "22",
		            "80, 443",
		             "3000",
		              "9090" ]
	  }
}
resource "google_compute_network" "default" {
	name = "first-attempt"
}

// count = 2

//startup-script = file("scripts/install-vm.sh")
//metadata_startup_script = "echo ("script for save ip") > /home/ip_address/IP-adds.txt

////metadata_startup_script = "VM_NAME=VM1\n${file("scripts/install-vm.sh")}"
