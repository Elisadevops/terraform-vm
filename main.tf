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

