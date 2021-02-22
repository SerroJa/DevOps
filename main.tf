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
	machine_type = var.type_machine
	zone 	     = var.zone_name
	allow_stopping_for_update = true

	tags 	     = ["web"]
 	boot_disk {	
		initialize_params {	
		  image = "ubuntu-os-cloud/ubuntu-1604-lts"
		}
 	}
	 network_interface {
		network = "${google_compute_network.vpc_network.id}"		
		//network = "default" 
	        access_config { 
			//Ephemeral ip 
		}
	 }
 metadata_startup_script = "echo 'file("scripts/install-vm.sh")' > /var/cache/ip-address.txt"//or path file("scripts/install-vm.sh")? gcloud compute firewall-rules create <rule-name> --allow tcp:9090 --source-tags=<list-of-my-instances-names> --source-ranges=0.0.0.0/0 --description="<my-description-here>"
 metadata = { 
	ssh-keys = "SerJioSh:var.ssh_key_pub"
 }
}
 
resource "google_compute_firewall" "default" {
    name    = var.fw_rule
    	//network = "default"
    network = "${google_compute_network.vpc_network.id}"

	allow {
	       protocol = "icmp"
	}	  
	allow {
	       protocol = "tcp"
	       ports    = [ "22", "80", "8080", "1000-2000", "9090" ]
	  }
	source_tags = ["web"]
	source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_network" "vpc_network" {
	name = "${var.network_place}" // network_id
}