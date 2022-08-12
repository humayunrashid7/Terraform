resource "aws_vpc" "default_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name         = "rcm-vpc"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}

resource "aws_subnet" "default_public_subnet_1" {
  vpc_id                  = aws_vpc.default_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ca-central-1a"

  tags = {
    Name         = "rcm-public-subnet-1"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}

resource "aws_subnet" "default_public_subnet_2" {
  vpc_id                  = aws_vpc.default_vpc.id
  cidr_block              = "10.123.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ca-central-1b"

  tags = {
    Name         = "rcm-public-subnet-2"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}

resource "aws_internet_gateway" "rcm_internet_gateway" {
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name         = "rcm_internet_gateway"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}

resource "aws_route_table" "rcm_public_rt" {
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name         = "rcm_public_rt"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}

resource "aws_route" "rcm_default_route" {
  route_table_id         = aws_route_table.rcm_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.rcm_internet_gateway.id
}

resource "aws_route_table_association" "rcm_route_table_association" {
  subnet_id      = aws_subnet.default_public_subnet_1.id
  route_table_id = aws_route_table.rcm_public_rt.id
}

resource "aws_security_group" "rcm_security_group" {
  name        = "rcm_security_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.default_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "rcm_security_group"
    Project      = "RCM"
    CreatedUsing = "terraform"
    CreatedBy    = "Humayun Rashid"
  }
}