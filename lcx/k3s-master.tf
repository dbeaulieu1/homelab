resource "proxmox_lxc" "basic" {
  target_node  = "pve"
  hostname     = "k3s-master"
  ostemplate   = "${var.ostemplate}"
  password     = "${var.password}"
  unprivileged = "${var.unprivileged}"
  memory       = "${var.memory}"
  swap         = "${var.swap}"
  start = true
  ssh_public_keys = "${var.ssh_public_keys}"

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "vm_ct"
    size    = "8G"
  }

  network {
    name   = "${var.network.name}"
    bridge = "${var.network.bridge}"
    ip     = "${var.network.ip}"
    hwaddr = "BC:24:11:04:03:D4"
  }
}