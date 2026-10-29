provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "public_data" {
  bucket = "bce62664-scan-test-public-data"
  acl    = "public-read"
}

resource "aws_security_group" "open_ssh" {
  name        = "bce62664-open-ssh"
  description = "SSH open to the world"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "unencrypted" {
  identifier          = "bce62664-scan-test-db"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "SuperSecret123!"
  publicly_accessible = true
  storage_encrypted   = false
  skip_final_snapshot = true
}
