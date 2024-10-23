terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}
provider "proxmox" {
  pm_api_url     = "https://64.255.204.91:8006/api2/json"  
  pm_user        = var.pm_user                                
  pm_password    = var.pm_password                            
  pm_tls_insecure = true  
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
    bridge = "vmbr0"            # your network bridge name
    tag    = 150                # VLAN ID 150
  }
}