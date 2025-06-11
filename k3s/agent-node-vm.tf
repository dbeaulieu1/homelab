resource "proxmox_vm_qemu" "cloudinit-test" {
    name = "k3s-agent-node"
    desc = "k3s agent node"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "pve"

    # The template name to clone this vm from
    clone = "ubuntu-2004-cloudinit-template"
    full_clone = false
    ciuser     = "root"
    cipassword = "fel1x$12"
    cicustom   = "vendor=fs2:snippets/qemu-guest-agent.yml"
  
    # Activate QEMU agent for this VM
    agent = 1
    ssh_private_key = file("../../mykey")
    ssh_user = "root"
    os_type = "cloud-init"
    #cores = 4
    cpu_type = "kvm64"
    memory = 10240
    balloon = 2048

    scsihw = "virtio-scsi-single"
    #boot = "order=scsi0"
    serial {  
        id = 0
        type = "socket"
    }

  disks {
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide2 {
        cloudinit {
          storage = "vm_ct"
        }
      }
    }
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          size         = 32
          storage      = "vm_ct"
          #cache        = "writeback"
          #iothread     = true
          #discard      = true
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