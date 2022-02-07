
output "public_dns" {
	value = aws_instance.ec2_public_subnet_instances[*].public_dns
}

output "private_network_instances_ip" {
	value = aws_instance.ec2_public_subnet_instances[*].private_ip
}


