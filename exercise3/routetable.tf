resource "aws_route_table" "dove-pub-RT" {
  vpc_id = aws_vpc.dove-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dove-IG.id

  }

  tags = {
    Name = "dove-pub-RT"

  }

}


resource "aws_internet_gateway" "dove-IG" {
  vpc_id = aws_vpc.dove-vpc.id

  tags = {
    Name = "dove-IG"
  }

}


resource "aws_route_table_association" "dove-pub-1-a" {
  subnet_id      = aws_subnet.dove-pub-1.id
  route_table_id = aws_route_table.dove-pub-RT.id

}


resource "aws_route_table_association" "dove-pub-2-a" {
  subnet_id      = aws_subnet.dove-pub-2.id
  route_table_id = aws_route_table.dove-pub-RT.id

}


resource "aws_route_table_association" "dove-pub-3-a" {
  subnet_id      = aws_subnet.dove-pub-3.id
  route_table_id = aws_route_table.dove-pub-RT.id

}

