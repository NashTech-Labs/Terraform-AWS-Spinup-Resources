#### Create vpc-eiv-sre-labtest Subnet
resource "aws_subnet" "vpc-eiv-sre-labtest-Az1" {
  vpc_id                  = "${aws_vpc.vpc-eiv-sre-labtest.id}"
  cidr_block              = "10.41.0.0/30"
  availability_zone       = "${var.region}"
  map_public_ip_on_launch = true

  tags {
    "Name"       = "vpc-eiv-sre-labtest-Az1"
    "SubnetType" = "Public"
  }
}

resource "aws_subnet" "vpc-eiv-sre-labtest-Az2" {
  vpc_id                  = "${aws_vpc.vpc-eiv-sre-labtest.id}"
  cidr_block              = "10.41.0.0/30"
  availability_zone       = "${var.region}"
  map_public_ip_on_launch = true

  tags {
    "Name"       = "vpc-eiv-sre-labtest-Az2"
    "SubnetType" = "Public"
  }
}
