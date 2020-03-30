resource "github_repository" "devs" {
	name = "mydevs"
       	description  = "MyRepoForPracticeDevs"
	private = false
	auto_init = true
}
resource "github_branch_protection" "branch_develop" {
	  repository     = "${github_repository.devs.name}"	  
	  branch         = "master"
	  enforce_admins = true
	
	required_status_checks {
		strict = false
		contexts = ["ci/travis"]
	}
			//git config branch.master.pushRemote no_push
			//enable_branch_restrictions = true
}
resource "google_compute_instance" "default"{
	count 	     = var.instance_count
	name 	     = var.machine_for_project
	machine_type = "n1-standard-1"
	zone 	     = "europe-west1-c"
	allow_stopping_for_update = true

	tags 	     = ["web"]
 	boot_disk {	
		initialize_params {	
		  image = "ubuntu-os-cloud/ubuntu-1604-lts"
		}
 	}
 network_interface {
			//network = "default" access_config { Ephemeral ip }
	network = "${google_compute_network.vpc_network.id}"
 }
 metadata_startup_script = "echo 'hostname -I' > /var/www/ip-address.txt"//or path file("scripts/install-vm.sh")? gcloud compute firewall-rules create <rule-name> --allow tcp:9090 --source-tags=<list-of-my-instances-names> --source-ranges=0.0.0.0/0 --description="<my-description-here>"
}
 
resource "google_compute_firewall" "default" {
    name    = "${var.network_place}-allow-ssh-and-icmp}"
    network = "${google_compute_network.vpc_network.id}"

	allow {
		protocol = "icmp"
	}	  
	  allow {
		 protocol = "tcp"
		 ports    = [  "80", 
				"8080",
				 "3000",
			           "9090" ]
	  }
	source_tags = ["web"]
}
resource "google_compute_network" "vpc_network" {
	name = "${var.network_place}" // network_id
}