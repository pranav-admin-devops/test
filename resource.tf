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
  name     = local.rg-names[terraform.workspace]
  location = local.rg_locations[terraform.workspace]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "pranav-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5", "8.8.8.8"]
}

resource "azurerm_subnet" "sub" {
  name                 = "pranav-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "pranav-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = "pranav-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_security_group" "linux-sg" {
  name                = "linux-sg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  depends_on = [ azurerm_resource_group.rg ]

  security_rule {
    name                       = "allow-ssh"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "allow-http"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "allow-internet-for-linux"
    priority                   = 104
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_interface_security_group_association" "linux-sg-association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.linux-sg.id
  depends_on = [  azurerm_network_interface.nic, azurerm_network_security_group.linux-sg ]
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = local.vm_name[terraform.workspace]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = local.vm_size[terraform.workspace]
  admin_username      = "pranav"
  admin_password = "Pranav@123"
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.8.1"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  address_space = ["40.0.0.0/16"]
  name = "module-vnet"
}