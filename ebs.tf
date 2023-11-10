resource "aws_ebs_volume" "ebs-dwm" {
  availability_zone = aws_instance.dwm-instance.availability_zone
  size              = 20

  tags = {
    name = "ebs dwm"
  }
}
