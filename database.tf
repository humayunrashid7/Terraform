resource "aws_db_subnet_group" "rcm_db_subnet" {
  name       = "rcm_db_subnet_group"
  subnet_ids = [aws_subnet.default_public_subnet_1.id, aws_subnet.default_public_subnet_2.id]

  tags = {
    Name         = "rcm_db_subnet"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage      = 5
  storage_type           = "standard"
  engine                 = "postgres"
  engine_version         = "11.12"
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.db_user
  password               = var.db_pass
  skip_final_snapshot    = true
  availability_zone      = "ca-central-1a"
  db_subnet_group_name   = aws_db_subnet_group.rcm_db_subnet.id
  vpc_security_group_ids = [aws_security_group.rcm_security_group.id]

  tags = {
    Name         = "rcm_db_instance"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}