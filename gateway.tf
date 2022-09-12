
resource "aws_internet_gateway" "venci-igw" {
  vpc_id = aws_vpc.venci-vpc.id
  tags = {
    Name = "VENCI-IGW"
  }

}