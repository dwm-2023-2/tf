resource "aws_network_interface" "dwm-network" {
  subnet_id       = aws_subnet.dwm-subnet-private.id
  security_groups = [aws_security_group.dwm-sg.id]
  tags = {
    name = "dwm-network"
  }
}

resource "aws_instance" "dwm-instance" {
  ami           = "ami-06db4d78cb1d3bbf9"
  instance_type = "t2.medium"

  network_interface {
    network_interface_id = aws_network_interface.dwm-network.id
    device_index         = 0
  }
  key_name = "dwm"
  tags = {
    name = "dwm-instance"
  }
}
