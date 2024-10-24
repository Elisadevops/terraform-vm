terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}
provider "proxmox" {
  pm_api_url     = "https://64.255.204.91:8006/api2/json"  # Proxmox server API endpoint
  pm_user        = "elisa@pve"                             # Your Proxmox user with necessary permissions
  pm_password    = "QODTXP3750DSuhCH58O3zOdkuVTyp9Nh"      # Your Proxmox password
  pm_tls_insecure = true                                   # Allows insecure TLS connections (set false in production)
}

#Configure Proxmox Resources Here
resource "proxmox_vm_qemu" "test_terraform" {
  name        = "terraform-vm"
  target_node = "goc2b1p3" 
  clone       = "123"
  os_type     = "cloud-init"
  cores       = 2
  memory      = 1024
  scsihw = "virtio-scsi-pci"
  disk {
    size = "10G"
    storage = "local-lvm"
    type = "SCSI"
  }
  network {
    model = "virtio"
    bridge = "vmbr0"                         
  }
}