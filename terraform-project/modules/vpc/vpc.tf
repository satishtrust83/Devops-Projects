resource "aws_vpc" "myvpc"{
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = var.vpc_name
    }
   enable_dns_support = true
   enable_dns_hostnames = true

}

resource "aws_internet_gateway" "internet_gw" {
    vpc_id = aws_vpc.myvpc.id

    tags = {
        Name = "Internet Gateway Terraform Assignment"
    }

}
