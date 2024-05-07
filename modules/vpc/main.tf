resource "aws_vpc" "virtual" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
  tags = {
    Name        = "dev-vpc"
    environment = "dev"
  }
}
resource "aws_subnet" "public" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.virtual.id
  cidr_block              = var.subnets_cidr[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_names[count.index]
  }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.virtual.id
  tags = {
    Name = "dev-vpc-Internet gateway"
  }
}
resource "aws_route_table" "devRt" {
  vpc_id = aws_vpc.virtual.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "dev-rt"
  }
}
resource "aws_route_table_association" "devrtasso" {
  count          = length(var.subnets_cidr)
  route_table_id = aws_route_table.devRt.id
  subnet_id      = aws_subnet.public[count.index].id
}