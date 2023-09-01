variable "vpc_cidr_block" {
  description = "cidr block for vpc"
  type = string
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet" {
  count = 3
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = "us-east-1" #change the AZs as needed
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = 3
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = "us-east-1" #change the AZs as needed

  tags = {
    Name ="private-subnet-${count.index}"
  }
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}