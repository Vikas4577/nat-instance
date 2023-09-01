provider "aws" {
  region = "us-east-1"  #see your desier region
}
module "vpc" {
  source = "./module/vpc"
  vpc_cidr_block = "10.0.0.0/16"
}
module "nat_instance" {
  source = "./module/nat-instance"
  nat_instance_ami = "ami-0def9f1558e16257f" #Replace witn actual Nat instance AMI
  public_subnet_ids = module.vpc.public_subnet_ids
}