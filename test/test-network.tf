resource "aws_vpc" "test-vpc-eu-west-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc-eu-west-1"
  }
}
resource "aws_internet_gateway" "test-internetgateway-eu-west-1" {
  tags = {
    Name = "test-internetgateway-eu-west-1"
  }
}
resource "aws_internet_gateway_attachment" "attachment-eu-west-1" {
  internet_gateway_id = aws_internet_gateway.test-internetgateway-eu-west-1.id
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
}
resource "aws_security_group" "test-securitygroup-eu-west-1" {
    vpc_id = aws_vpc.test-vpc-eu-west-1.id
    tags = {
      Name = "test-securitygroup"
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_subnet" "public_subnet-eu-west-11a" {
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-eu-west-11a"
  }
}
resource "aws_subnet" "private_subnet-eu-west-12b" {
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "private-subnet-eu-west-12b"
  }
}
resource "aws_subnet" "public_subnet-eu-west-13a" {
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-eu-west-13a"
  }
}
resource "aws_subnet" "private_subnet-eu-west-14b" {
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "private-subnet-eu-west-14b"
  }
}
resource "aws_eip" "nat_eip-eu-west-11a" {
  domain = "vpc"  
}
resource "aws_eip" "nat_eip-eu-west-13a" {
  domain = "vpc"
}
resource "aws_nat_gateway" "nat-gateway-eu-west-11a" {
  subnet_id = aws_subnet.public_subnet-eu-west-11a.id
  allocation_id = aws_eip.nat_eip-eu-west-11a.id
}
resource "aws_nat_gateway" "nat-gateway-eu-west-13a" {
  subnet_id = aws_subnet.public_subnet-eu-west-13a.id
  allocation_id = aws_eip.nat_eip-eu-west-13a.id
}
resource "aws_route_table" "routetable-private-a" {
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-eu-west-11a.id
  }
  tags = {
    Name = "RouteTable-A"
  }
}
resource "aws_route_table_association" "associate-a" {
  subnet_id = aws_subnet.private_subnet-eu-west-12b.id
  route_table_id = aws_route_table.routetable-private-a.id
}
resource "aws_route_table" "routetable-private-b" {
  vpc_id = aws_vpc.test-vpc-eu-west-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-eu-west-13a.id
  }
  tags = {
    Name = "RouteTable-B"
  }
}
resource "aws_route_table_association" "associate-b" {
  subnet_id = aws_subnet.private_subnet-eu-west-14b.id
  route_table_id = aws_route_table.routetable-private-b.id
}
resource "aws_vpc" "test-vpc-ap-southeast-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc-ap-southeast-1"
  }
}
resource "aws_internet_gateway" "test-internetgateway-ap-southeast-1" {
  tags = {
    Name = "test-internetgateway-ap-southeast-1"
  }
}
resource "aws_internet_gateway_attachment" "attachment-ap-southeast-1" {
  internet_gateway_id = aws_internet_gateway.test-internetgateway-ap-southeast-1.id
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
}
resource "aws_security_group" "test-securitygroup-ap-southeast-1" {
    vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
    tags = {
      Name = "test-securitygroup"
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_subnet" "public_subnet-ap-southeast-11a" {
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-ap-southeast-11a"
  }
}
resource "aws_subnet" "private_subnet-ap-southeast-12b" {
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "private-subnet-ap-southeast-12b"
  }
}
resource "aws_subnet" "public_subnet-ap-southeast-13a" {
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-ap-southeast-13a"
  }
}
resource "aws_subnet" "private_subnet-ap-southeast-14b" {
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "private-subnet-ap-southeast-14b"
  }
}
resource "aws_eip" "nat_eip-ap-southeast-11a" {
  domain = "vpc"  
}
resource "aws_eip" "nat_eip-ap-southeast-13a" {
  domain = "vpc"
}
resource "aws_nat_gateway" "nat-gateway-ap-southeast-11a" {
  subnet_id = aws_subnet.public_subnet-ap-southeast-11a.id
  allocation_id = aws_eip.nat_eip-ap-southeast-11a.id
}
resource "aws_nat_gateway" "nat-gateway-ap-southeast-13a" {
  subnet_id = aws_subnet.public_subnet-ap-southeast-13a.id
  allocation_id = aws_eip.nat_eip-ap-southeast-13a.id
}
resource "aws_route_table" "routetable-private-a" {
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-ap-southeast-11a.id
  }
  tags = {
    Name = "RouteTable-A"
  }
}
resource "aws_route_table_association" "associate-a" {
  subnet_id = aws_subnet.private_subnet-ap-southeast-12b.id
  route_table_id = aws_route_table.routetable-private-a.id
}
resource "aws_route_table" "routetable-private-b" {
  vpc_id = aws_vpc.test-vpc-ap-southeast-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-ap-southeast-13a.id
  }
  tags = {
    Name = "RouteTable-B"
  }
}
resource "aws_route_table_association" "associate-b" {
  subnet_id = aws_subnet.private_subnet-ap-southeast-14b.id
  route_table_id = aws_route_table.routetable-private-b.id
}