resource "aws_route_table" "venci-prt" {
  vpc_id = aws_vpc.venci-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.venci-igw.id
  }
  tags = {
    Name = "VENCI-PUBLIC_RT"
  }
}

resource "aws_route_table_association" "venci-prt-assoc" {
  count          = 2
  subnet_id      = aws_subnet.venci-snet.*.id[count.index]
  route_table_id = aws_route_table.venci-prt.id
}