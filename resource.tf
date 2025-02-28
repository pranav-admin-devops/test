# # resource "azurerm_virtual_network" "vnet" {
# #   name                = "pranav-network"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name
# #   address_space       = ["10.0.0.0/16"]
# #   dns_servers         = ["10.0.0.4", "10.0.0.5", "8.8.8.8"]
# #   depends_on = [ azurerm_resource_group.rg ]
# # }

# # resource "azurerm_subnet" "sub" {
# #   name                 = "pranav-subnet"
# #   resource_group_name  = azurerm_resource_group.rg.name
# #   virtual_network_name = azurerm_virtual_network.vnet.name
# #   address_prefixes     = ["10.0.1.0/24"]
# #   depends_on = [ azurerm_virtual_network.vnet ]
# # }

# # resource "azurerm_public_ip" "pip" {
# #   name                = "my-pip"
# #   resource_group_name = azurerm_resource_group.rg.name
# #   location            = azurerm_resource_group.rg.location
# #   allocation_method   = "Static"
# #   depends_on = [ azurerm_resource_group.rg ]
# # }

# # resource "azurerm_network_interface" "nic" {
# #   name                = "pranav-nic"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name

# #   ip_configuration {
# #     name                          = "internal"
# #     subnet_id                     = azurerm_subnet.sub.id
# #     private_ip_address_allocation = "Dynamic"
# #     public_ip_address_id = azurerm_public_ip.pip.id
# #   }
# #   depends_on = [ azurerm_subnet.sub ]
# # }

# # # resource "azurerm_windows_virtual_machine" "vm" {
# # #   name                = "pranav-machine"
# # #   resource_group_name = azurerm_resource_group.rg.name
# # #   location            = azurerm_resource_group.rg.location
# # #   size                = "Standard_F2s_v2"
# # #   admin_username      = "pranav"
# # #   admin_password      = "P@$$w0rd1234!"
# # #   network_interface_ids = [
# # #     azurerm_network_interface.nic.id,
# # #   ]

# # #   os_disk {
# # #     caching              = "ReadWrite"
# # #     storage_account_type = "Standard_LRS"
# # #   }

# # #   source_image_reference {
# # #     publisher = "microsoftwindowsdesktop"
# # #     offer     = "windows-11"
# # #     sku       = "win11-22h2-entn"
# # #     version   = "latest"
# # #   }
# # # }

# # resource "azurerm_network_security_group" "sg" {
# #   name                = "pranav-sg"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name
# #   depends_on = [ azurerm_resource_group.rg ]

# #   security_rule {
# #     name                       = "allow-rdp"
# #     priority                   = 100
# #     direction                  = "Inbound"
# #     access                     = "Allow"
# #     protocol                   = "Tcp"
# #     source_port_range          = "*"
# #     destination_port_range     = var.rdp-port
# #     source_address_prefix      = "*"
# #     destination_address_prefix = "*"
# #   }

# #   security_rule {
# #     name                       = "allow-internet"
# #     priority                   = 101
# #     direction                  = "Outbound"
# #     access                     = "Allow"
# #     protocol                   = "Tcp"
# #     source_port_range          = "*"
# #     destination_port_range     = "*"
# #     source_address_prefix      = "*"
# #     destination_address_prefix = "*"
# #   }

# # }

# # resource "azurerm_network_interface_security_group_association" "example" {
# #   network_interface_id      = azurerm_network_interface.nic.id
# #   network_security_group_id = azurerm_network_security_group.sg.id
# #   depends_on = [ azurerm_network_interface.nic, azurerm_network_security_group.sg ]
# # }

# # resource "azurerm_subnet" "linux-sub" {
# #   name                 = "linux-subnet"
# #   resource_group_name  = azurerm_resource_group.rg.name
# #   virtual_network_name = azurerm_virtual_network.vnet.name
# #   address_prefixes     = ["10.0.2.0/24"]
# #   depends_on = [ azurerm_virtual_network.vnet ]
# # }

# # resource "azurerm_public_ip" "linux-pip" {
# #   name                = "linux-pip"
# #   resource_group_name = azurerm_resource_group.rg.name
# #   location            = azurerm_resource_group.rg.location
# #   allocation_method   = "Static"
# #   depends_on = [ azurerm_resource_group.rg ]
# # }

# # resource "azurerm_network_interface" "linux-nic" {
# #   name                = "linux-nic"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name

# #   ip_configuration {
# #     name                          = "internal"
# #     subnet_id                     = azurerm_subnet.linux-sub.id
# #     private_ip_address_allocation = "Dynamic"
# #     public_ip_address_id = azurerm_public_ip.linux-pip.id
# #   }
# #   depends_on = [ azurerm_subnet.linux-sub ]
# # }

# # resource "azurerm_network_security_group" "linux-sg" {
# #   name                = "linux-sg"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name
# #   depends_on = [ azurerm_resource_group.rg ]

# #   security_rule {
# #     name                       = "allow-ssh"
# #     priority                   = 102
# #     direction                  = "Inbound"
# #     access                     = "Allow"
# #     protocol                   = "Tcp"
# #     source_port_range          = "*"
# #     destination_port_range     = var.ssh-port
# #     source_address_prefix      = "*"
# #     destination_address_prefix = "*"
# #   }

# #     security_rule {
# #     name                       = "allow-http"
# #     priority                   = 103
# #     direction                  = "Inbound"
# #     access                     = "Allow"
# #     protocol                   = "Tcp"
# #     source_port_range          = "*"
# #     destination_port_range     = var.web-port
# #     source_address_prefix      = "*"
# #     destination_address_prefix = "*"
# #   }


# #   security_rule {
# #     name                       = "allow-internet-for-linux"
# #     priority                   = 104
# #     direction                  = "Outbound"
# #     access                     = "Allow"
# #     protocol                   = "Tcp"
# #     source_port_range          = "*"
# #     destination_port_range     = "*"
# #     source_address_prefix      = "*"
# #     destination_address_prefix = "*"
# #   }

# # }

# # resource "azurerm_network_interface_security_group_association" "linux-sg-association" {
# #   network_interface_id      = azurerm_network_interface.linux-nic.id
# #   network_security_group_id = azurerm_network_security_group.linux-sg.id
# #   depends_on = [  azurerm_network_interface.linux-nic, azurerm_network_security_group.linux-sg ]
# # }

# # resource "azurerm_linux_virtual_machine" "linux-vm" {
# #   name                = local.vm_name
# #   resource_group_name = azurerm_resource_group.rg.name
# #   location            = azurerm_resource_group.rg.location
# #   size                = local.vm_size
# #   admin_username      = "pranav"
# #   admin_password = "Pranav@123"
# #   disable_password_authentication = "false"
# #   network_interface_ids = [
# #     azurerm_network_interface.linux-nic.id,
# #   ]

# #   os_disk {
# #     caching              = "ReadWrite"
# #     storage_account_type = "Standard_LRS"
# #   }

# #   source_image_reference {
# #     publisher = "canonical"
# #     offer     = "0001-com-ubuntu-server-jammy"
# #     sku       = "22_04-lts"
# #     version   = "latest"
# #   }
# #   depends_on = [ azurerm_network_interface.linux-nic ]
# # }

# # resource "azurerm_public_ip" "lb-pip" {
# #   name                = "lb-pip"
# #   resource_group_name = azurerm_resource_group.rg.name
# #   location            = azurerm_resource_group.rg.location
# #   allocation_method   = "Static"
# # }

# # resource "azurerm_lb" "pranav-lb" {
# #   name                = "pranav-lb"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name

# #   frontend_ip_configuration {
# #     name                 = "PublicIPAddress"
# #     public_ip_address_id = azurerm_public_ip.lb-pip.id
# #   }
# # }

# # resource "azurerm_lb_backend_address_pool" "lb-backend" {
# #   loadbalancer_id = azurerm_lb.pranav-lb.id
# #   name            = "BackEndAddressPool"
# # }

# # resource "azurerm_lb_rule" "lb-rule" {
# #   loadbalancer_id                = azurerm_lb.pranav-lb.id
# #   name                           = "http-rule"
# #   protocol                       = "Tcp"
# #   frontend_port                  = 80
# #   backend_port                   = 80
# #   frontend_ip_configuration_name = "PublicIPAddress"
# # }

# # resource "azurerm_network_interface_backend_address_pool_association" "nic-backend" {
# #   network_interface_id    = azurerm_network_interface.linux-nic.id
# #   ip_configuration_name   = "internal"
# #   backend_address_pool_id = azurerm_lb_backend_address_pool.lb-backend.id
# # }


# # resource "azurerm_storage_account" "storage" {
# #   name                     = "pranavadminstorage"
# #   resource_group_name      = azurerm_resource_group.rg.name
# #   location                 = azurerm_resource_group.rg.location
# #   account_tier             = "Standard"
# #   account_replication_type = "LRS"
# # }

# # resource "azurerm_storage_container" "example" {
# #   name                  = "linux-container"
# #   storage_account_id    = azurerm_storage_account.storage.id
# #   container_access_type = "private"
# # }

# # resource "azurerm_storage_blob" "resource-share" {
# #   name                   = "resource-backup.tf"
# #   storage_account_name   = azurerm_storage_account.storage.name
# #   storage_container_name = azurerm_storage_container.example.name
# #   type                   = "Block"
# #   source                 = "resource.tf"
# # }




# # resource "azurerm_public_ip" "pub-ip-new" {
# #   count = 4
# #   name                = "myip-${count.index}"
# #   resource_group_name = azurerm_resource_group.rg.name
# #   location            = azurerm_resource_group.rg.location
# #   allocation_method   = "Static"
# # }

# # resource "azurerm_resource_group" "myrg" {
# #   for_each = var.rg
# #   name     = each.key
# #   location = each.value
# # }


# # resource "azurerm_virtual_network" "vnet1" {
# #   for_each = var.vnets
# #   name                = each.key
# #   location            = each.value.location
# #   resource_group_name = azurerm_resource_group.rg.name
# #   address_space       = each.value.address_space
# #   dns_servers         = ["10.0.0.4", "10.0.0.5", "8.8.8.8"]
# # }

# # output "vnet-id" {
# #   value = {for k, v in azurerm_virtual_network.vnet1 : k => v.id} 
# # }



# # # data "azurerm_resource_group" "existing-rg" {
# # #   name = "pranav-demo"
# # # }

# # # data "azurerm_virtual_network" "vnet2" {
# # #   name                = "pranav-test-network"
# # #   resource_group_name = data.azurerm_resource_group.existing-rg.name
# # # }

# # # resource "azurerm_subnet" "sub1" {
# # #   name                 = "pranav-subnet"
# # #   resource_group_name  = data.azurerm_resource_group.existing-rg.name
# # #   virtual_network_name = data.azurerm_virtual_network.vnet2.name
# # #   address_prefixes     = ["10.0.1.0/24"]
# # # }



# # locals {
# #   env      = "dev"
# #   location = "centralindia"
# #   is_prod  = local.env == "prod"
# #   vm_size  = local.is_prod ? "Standard_D2s_v3" : "Standard_F2"
# #   vm_name  = "vm1"
# #   rg_name  = "pranav-prod-rg"
# # }


# # resource "azurerm_resource_group" "rg" {
# #   name     = local.rg_name
# #   location = local.location
# # }

# # resource "azurerm_network_security_group" "dynamic-sg" {
# #   name                = "dynamic-sg"
# #   location            = azurerm_resource_group.rg.location
# #   resource_group_name = azurerm_resource_group.rg.name
# #   depends_on          = [azurerm_resource_group.rg]
# #   dynamic "security_rule" {
# #     for_each = var.sg-rule
# #     content {
# #       name                       = security_rule.value.name
# #       priority                   = security_rule.value.priority
# #       direction                  = "Inbound"
# #       access                     = "Allow"
# #       protocol                   = "Tcp"
# #       source_port_range          = "*"
# #       destination_port_range     = security_rule.value.port
# #       source_address_prefix      = "*"
# #       destination_address_prefix = "*"
# #     }
# #   }
# # }



# resource "azurerm_resource_group" "rg" {
#   name     = "pranav-rg"
#   location = "centralindia"
# }

# resource "azurerm_virtual_network" "vnet" {
#   name                = "pranav-network"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5", "8.8.8.8"]
#   depends_on = [ azurerm_resource_group.rg ]
# }

# resource "azurerm_subnet" "sub" {
#   name                 = "pranav-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
#   depends_on = [ azurerm_virtual_network.vnet ]
# }

# resource "azurerm_public_ip" "pip" {
#   name                = "pranav-pip"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   allocation_method   = "Static"
#   depends_on = [ azurerm_resource_group.rg ]
# }

# resource "azurerm_network_interface" "nic" {
#   name                = "pranav-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.sub.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id = azurerm_public_ip.pip.id
#   }
#   depends_on = [ azurerm_subnet.sub ]
# }

# resource "azurerm_network_security_group" "linux-sg" {
#   name                = "linux-sg"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   depends_on = [ azurerm_resource_group.rg ]

#   security_rule {
#     name                       = "allow-ssh"
#     priority                   = 102
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = var.ssh-port
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#     security_rule {
#     name                       = "allow-http"
#     priority                   = 103
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = var.web-port
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }


#   security_rule {
#     name                       = "allow-internet-for-linux"
#     priority                   = 104
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

# }

# resource "azurerm_network_interface_security_group_association" "linux-sg-association" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = azurerm_network_security_group.linux-sg.id
#   depends_on = [  azurerm_network_interface.nic, azurerm_network_security_group.linux-sg ]
# }


# resource "azurerm_linux_virtual_machine" "linux-vm" {
#   name                = "pranav-vm"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = "Standard_F2"
#   admin_username      = "pranav"
#   admin_password = "Pranav@123"
#   disable_password_authentication = "false"
#   network_interface_ids = [
#     azurerm_network_interface.nic.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }

#     connection {
#     type     = "ssh"
#     user     = self.admin_username
#     password = self.admin_password
#     host     = self.public_ip_address
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update && sudo apt install nginx -y"
#     ]
#   }

#     provisioner "local-exec" {
#     command = "echo ${self.public_ip_address} > my_public_ip.txt"
#   }

#     provisioner "file" {
#     source      = "log.txt"
#     destination = "/tmp/log.txt"
#   }

#   depends_on = [ azurerm_network_interface.nic ]
# }

# output "my_public_ip" {
#   value = azurerm_public_ip.pip.ip_address
# }

# module "azure_vm" {
#   source = "git::https://github.com/pranav-admin-devops/azure_vm.git"
#   rg_name = "pranav-module-rg"
#   rg_location = "centralindia"
#   cidr = "10.0.0.0/16"
#   vm_size = "Standard_F2"
#   admin_username = "pranav"
#   admin_password = "Pranav@123"
#   address_prefixes = ["10.0.1.0/24"]
# }


locals {
  vm_size = {
    default = "Standard_F2"
    prod = "Standard_D2s_v3"
    dev = "Standard_B1s"
    test = "Standard_B2s"
  }
}

locals {
  rg-names = {
    default = "pranav-default-rg"
    prod = "pranav-prod-rg"
    dev = "pranav-dev-rg"
    test = "pranav-test-rg"
  }
}

locals {
  rg_locations = {
    default = "estus"
    prod = "centralus"
    dev = "centralindia"
    test = "westus"
  }
}

locals {
  vm_name = {
    default = "pranav-default-vm"
    prod = "pranav-prod-vm"
    dev = "pranav-dev-vm"
    test = "pranav-test-vm"
  }
}


resource "azurerm_resource_group" "rg" {
  name     = "pranav-prod-rg"
  location = "centralindia"
}

# resource "azurerm_virtual_network" "vnet" {
#   name                = "pranav-network"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5", "8.8.8.8"]
# }

# resource "azurerm_subnet" "sub" {
#   name                 = "pranav-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_public_ip" "pip" {
#   name                = "pranav-pip"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   allocation_method   = "Static"
# }

# resource "azurerm_network_interface" "nic" {
#   name                = "pranav-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.sub.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id = azurerm_public_ip.pip.id
#   }
# }

# resource "azurerm_network_security_group" "linux-sg" {
#   name                = "linux-sg"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   depends_on = [ azurerm_resource_group.rg ]

#   security_rule {
#     name                       = "allow-ssh"
#     priority                   = 102
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = var.ssh-port
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#     security_rule {
#     name                       = "allow-http"
#     priority                   = 103
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = var.web-port
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }


#   security_rule {
#     name                       = "allow-internet-for-linux"
#     priority                   = 104
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

# }

# resource "azurerm_network_interface_security_group_association" "linux-sg-association" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = azurerm_network_security_group.linux-sg.id
#   depends_on = [  azurerm_network_interface.nic, azurerm_network_security_group.linux-sg ]
# }


# resource "azurerm_linux_virtual_machine" "linux-vm" {
#   name                = "pranav-vm"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = "Standard_F2"
#   admin_username      = "pranav"
#   admin_password = "Pranav@123"
#   disable_password_authentication = "false"
#   network_interface_ids = [
#     azurerm_network_interface.nic.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }


resource "azurerm_storage_account" "storage" {
  name                     = "pranavadminstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "linux-container"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

