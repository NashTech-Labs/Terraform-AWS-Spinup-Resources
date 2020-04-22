resource "aws_db_instance" "mysql-rds" {
  identifier              = "${var.demo-rds}"
  allocated_storage       = "${var.rds-storage}"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.6.35"
  instance_class          = "${var.rds_node-size}"
  name                    = "demo-rds"
  username                = "usr1"
  password                = "${var.db-password}"
  port                    = 3306
  publicly_accessible     = false
  vpc_security_group_ids  = ["${var.sg-sre-labtest-rds}"]
  db_subnet_group_name    = "${aws_db_subnet_group.rds-subnet-group.name}"
  parameter_group_name    = "${aws_db_parameter_group.demo-rds-parameter-group.name}"
  multi_az                = true
  backup_retention_period = 7
  backup_window           = "00:00-00:30"
  maintenance_window      = "tue:01:00-tue:01:30"
}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name        = "${var.rds-subnet-group}"
  description = "Created from the RDS Management Console"
  subnet_ids  = ["${var.vpc-eiv-sre-labtest-Az1}"]
}

resource "aws_db_parameter_group" "demo-rds-parameter-group" {
  name        = "${var.demo-rds-pgroup}"
  family      = "mysql5.6"
  description = "This parameter group is related with Demo RDS"

  parameter {
    name         = "sql_mode"
    value        = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
    apply_method = "immediate"
  }
}
