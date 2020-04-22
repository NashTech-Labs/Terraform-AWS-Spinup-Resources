resource "aws_vpc" "vpc-eiv-sre-labtest" {
  cidr_block           = "${var.vpc-eiv-sre-labtest[0]}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags {
    "Name" = "vpc-eiv-sre-labtest"
  }
}


# Create Internet Gateway
resource "aws_internet_gateway" "igw-eiu-sre-labtest" {
  vpc_id = "${aws_vpc.vpc-eiv-sre-labtest.id}"

  tags {
    "Name" = vpc-eiv-sre-labtest
  }
}
