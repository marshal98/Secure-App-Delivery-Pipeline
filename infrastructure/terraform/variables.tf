variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "asia-south1-a"
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "secure-app-vpc"
}

variable "allowed_ssh_ip" {
  description = "Public IP address allowed to SSH into the VM (CIDR format)"
  type        = string
}

variable "ssh_username" {
  description = "Username for SSH login"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}