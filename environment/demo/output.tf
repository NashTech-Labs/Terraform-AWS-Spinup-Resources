output "web_vpc-id" {
  description = "The ID of the VPC Block"
  value       = "${var.vpc-eiv-sre-labtest}"
}

output "iam_user" {
  value = "${module.iam.iam_user}"
}
