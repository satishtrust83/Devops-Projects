resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.myvpc.id
    count = length(var.public_subnet_cidr_blocks)
    cidr_block = var.public_subnet_cidr_blocks[count.index]

    tags = {
        Name = "terraform-public-subnet_${count.index}"
    }
    
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone

}


resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.myvpc.id
    count = length(var.private_subnet_cidr_blocks)
    cidr_block = var.private_subnet_cidr_blocks[count.index]

    tags = {
        Name = "terraform-private-subnet_${count.index}"
    }
    
    availability_zone = var.availability_zone

}
