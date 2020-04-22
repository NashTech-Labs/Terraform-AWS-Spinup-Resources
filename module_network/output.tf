output "vpc-eiv-sre-labtest" {
  description = "The ID of the VPC"
  value       = "[${aws_vpc.vpc-eiv-sre-labtest.cidr_block}]"
}

output "vpc-eiv-sre-labtest-Az1" {
  description = "The ID of the hipaa subnet Az1"
  value       = "${aws_subnet.vpc-eiv-sre-labtest-Az1.id}"
}

output "vpc-eiv-sre-labtest-Az2" {
  description = "The ID of the hipaa subnet Az2"
  value       = "${aws_subnet.vpc-eiv-sre-labtest-Az2.id}"
}

output "sg-redis-demo" {
  value = "${aws_security_group.sg-sre-labtest-ec2-ssh.id}"
}

output "sg-rds-demo" {
  value = "${aws_security_group.sg-sre-labtest-rds.id}"
}
