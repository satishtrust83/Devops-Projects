output "vpc_id" {
    description = "vpc is of CIDR block $(var.vpc_cidr_range) is"
    value = aws_vpc.myvpc.id
}

output "public_subnet_ids" {
	description = "subnet id to expose output"
	value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
	description = "subnet id to expose output"
	value = aws_subnet.private_subnet[*].id
}

output "public_security_group_id" {
	description = "security group id"
	value = aws_security_group.sg_public.id
}

output "private_security_group_id" {
	description = "security group id"
	value = aws_security_group.sg_public.id
}

output "public_network_interface_ids" {
	description = "public network interfaces"
	value = aws_network_interface.public_nw_interface[*].id
}


output "private_network_interface_ids" {
	description = "private network interfaces"
	value = aws_network_interface.private_nw_interface[*].id
}

output "public_availability_zones" {
	description = "availability zone which are used in subnets"
	value = aws_subnet.public_subnet[*].availability_zone
}

output "private_availability_zones" {
	description = "availability zone which are used in subnets"
	value = aws_subnet.private_subnet[*].availability_zone
}