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
