data "aws_availability_zones" "available"{
    state = "available"
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc_demo.id
  cidr_block = var.subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraformAnsibleNginx"
  }
}