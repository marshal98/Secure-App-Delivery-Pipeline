##############################################
# Custom VPC
##############################################

resource "google_compute_network" "main" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

##############################################
# Subnet
##############################################

resource "google_compute_subnetwork" "main" {
  name          = "secure-app-subnet"
  ip_cidr_range = "10.0.1.0/24"

  region  = var.region
  network = google_compute_network.main.id
}

##############################################
# Firewall
##############################################

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.allowed_ssh_ips
  #source_ranges = ["0.0.0.0/0"]
  target_tags = ["web-server"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["web-server"]
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["web-server"]
}

##############################################
# VM
##############################################

resource "google_compute_instance" "vm" {

  name         = "secure-app-vm"
  machine_type = "e2-small"
  zone         = var.zone

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.main.id

    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.ssh_public_key_path)}"
  }
}