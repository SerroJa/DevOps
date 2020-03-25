provider "github"  {
 // name        = "Develop"
 // description = "MyRepoForPracticeDevs"
    token = var.github_token
}
resource "github_branch_protection" "develop" {
  repository     = "Develop"
  branch         = "master"
  enforce_admins = true
//git config branch.master.pushRemote no_push
//enable_branch_restrictions = true
}


provider "google" {
  project = "project_4_vm"
  region  = "europe-west1"
  credentials = file(var.credentials_file_path)

}
	
resource "google_compute_instance" "project_4_vm"{
	name = "tf-project-4-vm"
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
