resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.myvpc.id

    tags = {
        Name = "Route Table Terraform Assignment"
    }
}

resource "aws_route_table_association" "rt_association" {
  count = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route" "route" {
    route_table_id = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
}
