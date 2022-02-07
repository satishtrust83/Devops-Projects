resource "aws_security_group" "sg_public" {

    name        = "Terraform-Project-sg-public"
    vpc_id      = aws_vpc.myvpc.id

    tags = {
        Name = "Security-Group-Terraform-Public"
    }
}

resource "aws_security_group_rule" "sg_public_ingress_rules" {
    security_group_id = aws_security_group.sg_public.id
    type = "ingress"
    count = length(var.public_subnet_ingress_rules)
    from_port = var.public_subnet_ingress_rules[count.index].from_port
    to_port = var.public_subnet_ingress_rules[count.index].to_port
    protocol = var.public_subnet_ingress_rules[count.index].protocol
    cidr_blocks =  var.public_subnet_ingress_rules[count.index].cidr_blocks
    description = var.public_subnet_ingress_rules[count.index].description

}


resource "aws_security_group_rule" "sg_public_egress_rules" {
    security_group_id = aws_security_group.sg_public.id
    type = "egress"
    
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks =  ["0.0.0.0/0"]
    description = "Open to all"
}

