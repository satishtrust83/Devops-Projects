resource "aws_security_group" "sg_private" {

    name        = "Terraform-Project-sg-private"
    vpc_id      = aws_vpc.myvpc.id

    tags = {
        Name = "Security-Group-Terraform-private"
    }
}

resource "aws_security_group_rule" "sg_private_ingress_rules" {
    security_group_id = aws_security_group.sg_private.id
    type = "ingress"

    count = length(var.private_subnet_ingress_rules) 
    from_port = var.private_subnet_ingress_rules[count.index].from_port
    to_port = var.private_subnet_ingress_rules[count.index].to_port
    protocol = var.private_subnet_ingress_rules[count.index].protocol
    cidr_blocks =  var.public_subnet_cidr_blocks
    description = var.private_subnet_ingress_rules[count.index].description

}


resource "aws_security_group_rule" "sg_private_egress_rules" {
    security_group_id = aws_security_group.sg_private.id
    
    type = "egress"    
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks =  ["0.0.0.0/0"]
    description = "Open to all"
}

