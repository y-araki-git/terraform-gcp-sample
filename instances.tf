## web
resource "google_compute_address" "web01" {
  name   = "samplehost"
  region = "${var.region}"
}

resource "google_compute_instance" "web01" {
  name         = "samplehost"
  machine_type = "n1-standard-1"
  zone         = "${var.region_zone}"

  #  tags         = ""

  boot_disk {
    initialize_params {
      #image = "centos-cloud/centos-6"
      image = "ubuntu-1604-lts"
      size  = "50"
      type  = "pd-ssd"
    }
  }
  metadata_startup_script = <<EOT
#!/bin/bash
apt-get update && apt-get install -y python
grep "^Port 2201" /etc/ssh/sshd_config > /dev/null 2>&1
if [ "$?" = "1" ];then
  sed -i 's/^Port 22/#Port 22\nPort 22201/' /etc/ssh/sshd_config
  systemctl restart sshd.service
fiEOT
  network_interface {
    address    = "xxx.xxx.xxx.xxx"
    subnetwork = "${google_compute_subnetwork.subnet1.name}"

    access_config {
      # static external ip
      nat_ip = "${google_compute_address.web01.address}"
    }
  }
  metadata {
    "block-project-ssh-keys" = "true"
    "sshKeys"                = "${var.bastion_ssh_keys}"
  }
}
