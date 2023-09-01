variable "nat_instance_ami" {
  description = "ami-0def9f1558e16257f"
  type = string
}
variable "public_subnet_ids" {
  description = "list of public subnets ids"
  type = list(string)
}

resource "aws_instance" "nat_instance" {
  ami = var.nat_instance_ami
  instance_type = "t2.micro"
  subnet_id = element(var.public_subnet_ids,0) #use one of the public subnet
  tags = {
    Name = "nat-instance"
  }
}