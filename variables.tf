# N. Virginia [On Demand -$0.0928 per Hour - 17-Feb-2021]
variable "ec2_type" {
  type    = string
  default = "t2.large"
}

# N. Virginia [$0.136 per Hour - 17-Feb-2021]
variable "rds_type" {
  type    = string
  default = "db.t3.large"
}
