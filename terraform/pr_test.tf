resource "aws_ebs_volume" "pr_scan_unencrypted" {
  availability_zone = "us-west-2a"
  size              = 10
  encrypted         = false
}
