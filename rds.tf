resource "aws_db_subnet_group" "dbsubnet" {
  name       = "main"
  subnet_ids = [aws_subnet.dwm-subnet-public.id, aws_subnet.dwm-subnet-private.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "dwmdb" {
  allocated_storage      = 10
  db_name                = "dwmdb"
  engine                 = "postgres"
  engine_version         = "14.7"
  instance_class         = "db.t3.micro"
  username               = var.rds_user
  password               = var.rds_pwd
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.dwm-sg.id]
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.name
}
