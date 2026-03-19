provider "google" {
  project = "vl-foundatoin"
  region  = "asia-south1"
  zone    = "asia-south1-a"
}

resource "google_compute_instance" "vm" {
  name         = "linux-cheap-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_storage_bucket" "bucket" {
  name          = "vl-foundatoin-bucket-12345"  # must be globally unique
  location      = "ASIA-SOUTH1"                 # Mumbai region
  force_destroy = true

  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}