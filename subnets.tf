############ DEFAULT VPC ############
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

locals {
  az_names = toset(["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"])
}

############ DEFAULT SUBNETS ############
resource "aws_default_subnet" "default" {
  for_each = local.az_names
  availability_zone = each.key
  tags = {
    Name = "Default SUBNET ${each.key}"
  }
}

############ RDS SUBNET GROUP ############
data "aws_subnet_ids" "default" {
  vpc_id = aws_default_vpc.default.id
}

resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = data.aws_subnet_ids.default.ids
}
