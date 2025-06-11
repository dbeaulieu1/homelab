variable "network" {
  type = object({
    name    = string
    bridge   = string
    ip      = string
  })
  default = {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

variable "rootfs" {
  type = object({
    storage = string
    size    = string
  })
  default = {
    storage = "vm_ct"
    size    = "8G"
  }
}

variable "ostemplate" {
  type    = string
  default = "fs2:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
}

variable "password" {
  type    = string
  default = "fel1x$12"
}

variable "memory" {
  type    = number
  default = 2048
}

variable "swap" {
  type    = number
  default = 512
}

variable "unprivileged" {
  type    = bool
  default = false
}

variable "start" {
  type    = bool
  default = true
}

variable "pm_tls_insecure" {
  type    = bool
  default = true
}

variable "pm_api_url" {
  type    = string
  default = "https://pve3.dowalt.org:8006/api2/json"
}
variable "ssh_public_keys" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzNyl/t3PYQJ99c+WMcSXRdXEPgLq/BKu7++q/khjr5/Gwfk8/zyzt1kAS70nnJMWPUjG4d+lUqbXkLwa2N99NlL21eGabKyfUT86ajYv1cbkkLnWlhwmpH5t7zDZktvfk2z8eDmMklPWzTvAUMjmeSO+E/xCEcfg0ze/Z1duKdIZ9d0wyE3r1ncDe074qvKEcyx2yZVpHChezQSHDe9Hl5d1vBDw+URsfxAONXaT4ZubazEGapTGHwsBRuqNg09sfjoir7tgF2tgRRnKTApS4jsWejwichcy6w7iILomJ/B8HtqACqYxTMnChLZZeaDWmgTHruDy2tTV0Tvy6P63cHj1lS4uRiKQLRTKYLQ2OjC8/yZNh/7/B8YpL6qlymaBhpdMmnybLsoFh5LzQcHexvn3o7VY3cuDjZ3NEs38LIAmYVbTidVfYXGj/lrtZXUv1dwz5BmEa+6vfeYEDDUwma9O2PHy/uk1MuynXZXU7qJL/GqBzrO+4JkPBGLYN+6s= ddbu@GFT-17CL374"
}
