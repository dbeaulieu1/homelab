terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc8"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://pve3.dowalt.org:8006/api2/json"
    pm_api_token_secret = "49259e52-ce41-4642-82c1-a52b12e80aaa"
    pm_api_token_id = "terraform@pam!terraformtokenid"
}

resource "proxmox_vm_qemu" "cloudinit-test" {
    name = "k3s-test-vm"
    desc = "A test for using terraform and cloudinit"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "pve3"

    # The template name to clone this vm from
    clone = "ubuntu-2004-cloudinit-template"

    # Activate QEMU agent for this VM
    agent = 1
    ssh_private_key = file("./ssh.key")
    ssh_user = "root"
    os_type = "cloud-init"
    cores = 2
    sockets = 1
    vcpus = 0
    cpu_type = "host"
    memory = 2048
    scsihw = "lsi"

    # Setup the disk
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "vm_ct"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = 32
                    cache           = "writeback"
                    storage         = "vm_ct"
                    iothread        = true
                    discard         = true
                }
            }
        }
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "BC:24:11:D1:60:76"
    }

    # Setup the ip address using cloud-init.
    # boot = "order=scsi0"
    # Keep in mind to use the CIDR notation for the ip.
    # ipconfig0 = "ip=192.168.1.20/25,gw=192.168.1.1"
    ipconfig0 = "ip=dhcp"

}