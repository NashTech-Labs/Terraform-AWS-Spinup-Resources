resource "aws_vpn_gateway" "vpg-eiu-sre-labtest" {
  vpc_id = "${aws_vpc.vpc-eiv-sre-labtest.id}"

  tags = {
    Name = "vpg-eiu-sre-labtest"
  }
}