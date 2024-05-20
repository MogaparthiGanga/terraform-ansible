resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_demo.id

    tags = {
      Name = "terraformAnsible"
    }
  
}