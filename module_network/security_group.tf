resource "aws_security_group" "sg-sre-labtest-ec2-ssh" {
  name        = "${var.sg-sre-labtest-ec2-ssh}"
  description = "Security group for nodes"
  vpc_id      = "${aws_vpc.vpc-eiv-sre-labtest.id}"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["14.98.68.88/29"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    "Name" = "sg-sre-labtest-ec2-ssh"
  }
}

resource "aws_security_group" "sg-sre-labtest-rds" {
  name        = "${var.sg-sre-labtest-rds}"
  description = "Security Groups for ALB"
  vpc_id      = "${aws_vpc.vpc-eiv-sre-labtest.id}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["14.98.68.88/29"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    "Name" = "sg-sre-labtest-rds"
  }
}

