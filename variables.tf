# 17-Feb-2021 - N. Virginia EC2 Linux t2.micro $0.0116/hour ($1.95/week)
variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

# 17-Feb-2021 - N. Virginia RDS MySQL db.t3.micro $0.017/hour ($2.86/week)
variable "rds_type" {
  type    = string
  default = "db.t2.micro"
}

