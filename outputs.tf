output "status_page_public_ip" {
  value = google_compute_instance.default.0.network_interface.0.access_config.0.nat_ip
}
