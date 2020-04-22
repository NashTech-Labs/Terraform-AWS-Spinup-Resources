output "aws_region" {
  description = "AWS Region"
  value       = "${var.region}"
}

output "web_vpc-id" {
  description = "The ID of the VPC Block"
  value       = "${module.environment."vpc-eiv-sre-labtest"}"
}
