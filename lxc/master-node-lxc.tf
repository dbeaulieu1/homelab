data "local_file" "ssh_public_key" {
  filename = "../../mykey.pub"
}

resource "proxmox_lxc" "basic" {
  target_node  = "pve"
  hostname     = "k3s-master"
  ostemplate   = "fs2:vztmpl/ubuntu-24.10-standard_24.10-1_amd64.tar.zst"
  password     = "fel1x$12"
  unprivileged = true
  ostype       = "ubuntu"
  arch         = "amd64"
  description  = "K3s Master Node"
  start = true
  memory = 2048
  swap = 512
  cpuunits = 50
  

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-zfs"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
