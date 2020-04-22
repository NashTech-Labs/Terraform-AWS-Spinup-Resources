variable "region" {
  default = "us-east-1"
}

variable "vpc-eiv-sre-labtest" {
  default = {
    cidr = "10.1.0.0/16"
  }
}

variable "vpc-eiv-sre-labtest-Az1" {
  type    = "list"
  default = ["10.41.0.0/30"]
}

variable "sg-sre-labtest-ec2-ssh" {
  default = "sg-sre-labtest-ec2-ssh"
}

variable "sg-sre-labtest-rds" {
  default = "sg-sre-labtest-rds"
}

variable "rds-subnet-group" {
  default = "rds-subnet"
}

variable "rds_node-size" {
  default = "db.t3.micro"
}

variable "rds-storage" {
  default = "100"
}

variable "demo-rds-pgroup" {
  default = "demo-rds-pgroup"
}

variable "db_password" {}

variable "eiu-sre-labtest" {
  default = "eiu-sre-labtest"
}

variable "eiu-sre" {
  type    = "list"
  default = ["user1", "user2"]
}

variable "eiu-labetst-iam-role" {
  default = "eiu-labetst-iam-role"
}

variable "performance_mode" {
  default = "generalPurpose"
}

nodes_asg_desired_capacity  = 1

nodes_asg_min_size          = 1

nodes_asg_max_size          = 1