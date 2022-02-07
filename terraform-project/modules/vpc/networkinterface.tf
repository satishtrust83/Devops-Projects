resource "aws_network_interface" "public_nw_interface" {
    count = length(var.public_subnet_cidr_blocks)
    subnet_id = aws_subnet.public_subnet[count.index].id
    security_groups = [aws_security_group.sg_public.id]
    tags = {
        Name = "Terraform_public_Network-Interface_${count.index}"
    }
}

resource "aws_network_interface" "private_nw_interface" {
    count = length(var.private_subnet_cidr_blocks)
    subnet_id = aws_subnet.private_subnet[count.index].id
    security_groups = [aws_security_group.sg_private.id]
    tags = {
        Name = "Terraform_private_Network-Interface_${count.index}"
    }
}
