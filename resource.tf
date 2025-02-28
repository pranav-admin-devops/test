resource "aws_vpc" "vnet" {
#   cidr_block = "10.0.0.0/16"
#     tags = {
#     Name = "pranav-vnet"
#   }
# }

# resource "aws_subnet" "pranav-sub" {
#   vpc_id     = aws_vpc.vnet.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone =  "us-east-1a"

#   tags = {
#     Name = "pranav-subnet"
#   }
# }

# # resource "aws_internet_gateway" "gw" {
# #   vpc_id = aws_vpc.vnet.id

# #   tags = {
# #     Name = "pranav-gateway"
# #   }
# # }

# # resource "aws_route_table" "pranav-rt" {
# #   vpc_id = aws_vpc.vnet.id

# #   route {
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = aws_internet_gateway.gw.id
# #   }

# #   tags = {
# #     Name = "pranav-route"
# #   }
# # }

# # resource "aws_route_table_association" "a" {
# #   subnet_id      = aws_subnet.pranav-sub.id
# #   route_table_id = aws_route_table.pranav-rt.id
# # }

# # resource "aws_eip" "myeip" {
# #   domain   = "vpc"
# #   tags = {
# #     Name = "pranav-PIP"
# #   }
# # }

# # resource "aws_network_interface" "pranav-nic" {
# #   subnet_id       = aws_subnet.pranav-sub.id
# #   security_groups = [aws_security_group.allow_connections.id]
# # }

# # resource "aws_eip_association" "eip_assoc" {
# #   network_interface_id = aws_network_interface.pranav-nic.id
# #   allocation_id = aws_eip.myeip.id
# # }

# # resource "aws_security_group" "allow_connections" {
# #   name        = "pranav-sg"
# #   vpc_id      = aws_vpc.vnet.id

# # }

# # resource "aws_vpc_security_group_ingress_rule" "allow_rdp" {
# #   security_group_id = aws_security_group.allow_connections.id
# #   cidr_ipv4         = "0.0.0.0/0"
# #   from_port         = 3389
# #   ip_protocol       = "tcp"
# #   to_port           = 3389
# # }

# # resource "aws_vpc_security_group_ingress_rule" "allow_http" {
# #   security_group_id = aws_security_group.allow_connections.id
# #   cidr_ipv4         = "0.0.0.0/0"
# #   from_port         = 80
# #   ip_protocol       = "tcp"
# #   to_port           = 80
# # }

# # resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
# #   security_group_id = aws_security_group.allow_connections.id
# #   cidr_ipv4         = "0.0.0.0/0"
# #   ip_protocol       = "-1" # semantically equivalent to all ports
# # }


# # resource "aws_instance" "vm" {
# #   ami           = "ami-07fa5275316057f54"
# #   instance_type = "t3.micro"
# #   key_name = "pranav-demo-vm"
# #   availability_zone = "us-east-1a"
# #   network_interface {
# #     network_interface_id = aws_network_interface.pranav-nic.id
# #     device_index = 0
# #   }

# #   tags = {
# #     Name = "pranav-vm"
# #   }
# # }

# resource "aws_s3_bucket" "mybucket" {
#   bucket = "my-terra-state-pranav"
#   force_destroy = true
# }
