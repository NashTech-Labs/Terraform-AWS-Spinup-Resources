resource "aws_instance" "ec2-instance-1" {
  ami = "${data.aws_ami.ubuntu-xenial}"
  instance_type = "t2.micro"
  key_name = "${var.ec2-instance-1}"
  vpc_security_group_ids = ["${var.sg-sre-labtest-ec2-ssh}"]
  subnet_id = "${var.vpc-eiv-sre-labtest-Az2}"

  tag = {
    Name = "ec2-instance-1"
    key_name = "${var.ec2-instance-2}"
    vpc_security_group_ids = ["${var.sg-sre-labtest-ec2-ssh}"]
    subnet_id = "${var.vpc-eiv-sre-labtest-Az2}"
  }
}


resource "aws_instance" "ec2-instance-2" {
  ami = "${data.aws_ami.ubuntu-xenial}"
  instance_type = "t2.micro"

  tag = {
    Name = "ec2-instance-2"
  }
}


data "aws_ami" "ubuntu-xenial" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-18.04-amd64-server-*"]
  }
  owners = []
}