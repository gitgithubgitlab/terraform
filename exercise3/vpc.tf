resource "aws_vpc" "dove-vpc" {
  cidr_block = "10.0.0.0/16"

  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vprofile"
  }

}


resource "aws_subnet" "dove-pub-1" {
  vpc_id = aws_vpc.dove-vpc.id

  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dove-pub-1"
  }

}

resource "aws_subnet" "dove-pub-2" {
  vpc_id = aws_vpc.dove-vpc.id

  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dove-pub-2"
  }

}

resource "aws_subnet" "dove-pub-3" {
  vpc_id = aws_vpc.dove-vpc.id

  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.ZONE3
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dove-pub-3"
  }

}

resource "aws_subnet" "dove-priv-1" {
  vpc_id = aws_vpc.dove-vpc.id

  cidr_block              = "10.0.4.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dove-priv-1"
  }

}

resource "aws_subnet" "dove-priv-2" {
  vpc_id = aws_vpc.dove-vpc.id

  cidr_block              = "10.0.5.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dove-priv-2"
  }

}

resource "aws_subnet" "dove-priv-3" {
  vpc_id = aws_vpc.dove-vpc.id

  cidr_block              = "10.0.6.0/24"
  availability_zone       = var.ZONE3
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dove-priv-3"
  }

}

