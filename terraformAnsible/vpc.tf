resource "aws_vpc" "vpc_demo" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = "vpc_demo"
    }
  
}