variable "ssh-port" {
  type    = number
  default = 22
}

variable "web-port" {
  type    = number
  default = 80
}

variable "rdp-port" {
  type    = number
  default = 3389
}

# variable "rg-location" {
#   type    = list(string)
#   default = ["centralindia", "eastus", "westeurope"]
# }

# # variable "size" {
# #     type = map(string)
# #   default = {
# #     dev = "Standard_F2"
# #     test = "Standard_B1s"
# #     prod = "Standard_D2s_v3"
# #   }
# # }

# # variable "name" {}
# # variable "location" {}
# # variable "size" {}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# variable "rg" {
#   type = map(string)
#   default = {
#     "rg1" = "eastus"
#     "rg2" = "westus"
#     "rg3" = "centralindia"
#   }
# }


# variable "vnets" {
#   type = map(object({
#     location      = string
#     address_space = list(string)
#   }))
#   default = {
#     "vnet1" = {
#       location      = "eastus"
#       address_space = ["10.0.0.0/16"]

#     }
#     "vnet2" = {
#       location      = "eastus"
#       address_space = ["20.0.0.0/16"]
#     }
#   }

# }

# variable "sg-rule" {
#   default = [{ name = "allow-ssh", priority = "100", port = "22" },
#     { name = "allow-http", priority = "101", port = "80" },
#   { name = "allow-rdp", priority = "102", port = "3389" }]
# }
