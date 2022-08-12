resource "aws_instance" "docker_ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name         = "rcm-docker-ec2"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}