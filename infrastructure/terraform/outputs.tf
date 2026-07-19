output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}

output "vpc_name" {
  value = google_compute_network.main.name
}

output "subnet_name" {
  value = google_compute_subnetwork.main.name
}

output "ssh_command" {
  description = "SSH command"
  value       = "ssh ${var.ssh_username}@${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}"
}

output "gcloud_ssh_command" {
  description = "gcloud SSH command"
  value       = "gcloud compute ssh ${google_compute_instance.vm.name} --zone ${var.zone}"
}