resource "aws_route_table" "rtb-eiu-sre-labtest" {
  vpc_id = "${aws_vpc.vpc-eiv-sre-labtest.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw-eiu-sre-labtest.id}"
  }

  tags {
    "Name" = "rtb-eiu-sre-labtest"
  }
}

################ Route Table Association
resource "aws_route_table_association" "rtb-eiu-sre-labtest-rta" {
  route_table_id = "${aws_route_table.rtb-eiu-sre-labtest.id}"
  subnet_id      = "${aws_subnet.vpc-eiv-sre-labtest-Az1.id}"
}

resource "aws_route_table_association" "app-tier-2-rta" {
  route_table_id = "${aws_route_table.rtb-eiu-sre-labtest.id}"
  subnet_id      = "${aws_subnet.vpc-eiv-sre-labtest-Az2.id}"
}

