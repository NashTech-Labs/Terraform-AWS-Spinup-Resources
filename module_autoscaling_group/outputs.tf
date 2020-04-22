output "asg_name" {
  value = "${join("", aws_autoscaling_group.asg.*.name)}"
}
