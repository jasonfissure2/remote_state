provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "${var.creds_file}"
  profile                 = "${var.aws_profile}"
}

resource "aws_s3_bucket" "remote_state" {
  bucket = "${var.prefix}-remote-state-${var.environment}"
  acl    = "authenticated-read"

  versioning {
    enabled = true
  }

  tags {
    Name = "${var.prefix}-remote-state-${var.environment}"
    Environment = "${var.environment}"
  }
}
