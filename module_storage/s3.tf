resource "aws_s3_bucket" "eiu-sre-labtest" {
  bucket = "${var.eiu-sre-labtest}"
  acl    = "public"
  key    = "labtest.txt"
  source = "path/to/file"
}