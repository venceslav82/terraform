resource "aws_subnet" "venci-snet" {
  count                   = 2
  vpc_id                  = aws_vpc.venci-vpc.id
  cidr_block              = var.venci-cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.venci-avz.names[count.index]
  tags = {
    Name = "VENCI-SUB-NET-${count.index + 1}"
  }

} 