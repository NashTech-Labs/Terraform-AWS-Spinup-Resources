output "iam_user" {
  value = "${aws_iam_user.eiu-sre.*.name}"
}

