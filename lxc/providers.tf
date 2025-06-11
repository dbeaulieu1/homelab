terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc8"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = false
    pm_api_url = "https://pve.dowalt.org:8006/api2/json"
    pm_api_token_secret = "49259e52-ce41-4642-82c1-a52b12e80aaa"
    pm_api_token_id = "terraform@pam!terraformtokenid"
}
