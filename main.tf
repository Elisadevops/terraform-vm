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
  pm_password     = "QODTXP3750DSuhCH58O3zOdkuVTyp9Nh"                          
  pm_tls_insecure = true                                     
}