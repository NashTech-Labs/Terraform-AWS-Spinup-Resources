provider "aws" {
  region = "${var.region}"
}

module "network" {
  source = "../../module_network"

  vpc-eiv-sre-labtest = [
    "${var.vpc-eiv-sre-labtest["cidr"]}",
  ]

  vpc-eiv-sre-labtest-subnet   = ["${var.vpc-eiv-sre-labtest-Az1}"]


  region                            = "${var.region}"
  sg-sre-labtest-ec2-ssh            = "${var.sg-sre-labtest-ec2-ssh}"
  sg-sre-labtest-rds                = "${var.sg-sre-labtest-rds}"
  subnet-sre-labtest                = "${var.vpc-eiv-sre-labtest-Az1}"
}

module "storage" {
  source                      = "../../module_storage"
  eiu-sre-labtest             = "${var.eiu-sre-labtest}"
  performance_mode            = "${var.performance_mode}"
  vpc-eiv-sre-labtest         = "${var.vpc-eiv-sre-labtest}"
  vpc-eiv-sre-labtest-Az1     = "${var.vpc-eiv-sre-labtest-Az1}"
}

module "iam" {
  source                        = "../../module_iam"
  eiu-sre                       = "${var.eiu-sre}"
  eiu-sre-labtest-iam-role      = "${var.eiu-labetst-iam-role}"
  group-name                    = "default-group"
}

module "database" {
  source                   = "../../module_database"
  vpc-eiv-sre-labtest-Az1  = ["${module.network.vpc-eiv-sre-labtest-Az1}"]
  demo-rds                 = "demo-rds"
  rds_node-size            = "${var.rds_node-size}"
  rds-storage              = "${var.rds-storage}"
  rds-subnet-group         = "${var.rds-subnet-group}"
  demo-rds-pgroup          = "${var.demo-rds-pgroup}"
  sg_rds-demo              = "${module.network.sg-rds-demo}"
  region                   = "${var.region}"
  db-password              = "${var.db_password}"
  sg-sre-labtest-rds       = "${module.network.sg-rds-demo}"
}
