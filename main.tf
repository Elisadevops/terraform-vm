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
  pm_user        = "elisa@pve"                             
  pm_password    = "QODTXP3750DSuhCH58O3zOdkuVTyp9Nh"      
  pm_tls_insecure = true                                   
}

#Configure Proxmox Resources Here
resource "proxmox_vm_qemu" "terraform_proxmox_test" {
  name        = "terraform-vm-${count.index + 1}"  # VM Name with index
  target_node = var.target_node                         # Proxmox node name
  clone       = var.template_name                       # Template to clone
  count       = 1  
  vmid        =  0861
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
    tag    = "151"                        
  }
}