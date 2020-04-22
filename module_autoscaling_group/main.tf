
resource "aws_launch_template" "demo" {
    name_prefix                = "demo-lc"
    image_id                   = "${var.lc_ami_id}"
    instance_type              = "${var.lc_instance_type}"
    key_name                   = "${var.lc_key_name}"
    vpc_security_group_ids     = [ "${var.lc_security_groups}" ]
    user_data = "${base64encode("<<EOF
           #!/bin/bash
           sudo yum -q -y update
           sudo yum -q -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
           sudo yum install nginx -y
           sudo service nginx start
           echo '<html><head><title>Hashicorp Terraform</title></head><body><h1>Automating Infrastructure on AWS Using Terraform</h1></body></html>' | sudo tee /usr/share/nginx/html/index.html
    EOF")}"
}


resource "aws_autoscaling_group" "asg" {

    desired_capacity          = "${var.asg_desired_capacity}"
    min_size                  = "${var.asg_min_size}"
    max_size                  = "${var.asg_max_size}"
    availability_zones        = ["${var.availability_zones}"]

    launch_template {
        id      = "${aws_launch_template.demo.id}"
        version = "$Latest"
    }

    load_balancers = ["${var.asg_load_balancers}"]
}


