# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "gourmeal" {
  cidr_block = "10.0.0.0/16"

  tags = tomap({
    "Name"                                      = "gourmeal-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_subnet" "gourmeal" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.gourmeal.id

  tags = tomap({
    "Name"                                      = "gourmeal-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_internet_gateway" "gourmeal" {
  vpc_id = aws_vpc.gourmeal.id

  tags = {
    Name = "gpormeal-IGW-"
  }
}

resource "aws_route_table" "gourmeal" {
  vpc_id = aws_vpc.gourmeal.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gourmeal.id
  }
}

resource "aws_route_table_association" "gourmeal" {
  count = 2

  subnet_id      = aws_subnet.gourmeal.*.id[count.index]
  route_table_id = aws_route_table.gourmeal.id
}