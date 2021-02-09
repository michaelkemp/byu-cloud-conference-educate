############ GET MY IP ############
data "external" "ipify" {
  program = ["curl", "-s", "https://api.ipify.org?format=json"]
}

############ SSH FROM MY IP SECURITY GROUP ############
resource "aws_security_group" "SSH-MYSQL" {
  name        = "SSH-MYSQL"
  description = "SSH-MYSQL Security Group"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["${data.external.ipify.result.ip}/32"]
    description = "SSH From My IP"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["${data.external.ipify.result.ip}/32"]
    description = "MySQL From My IP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
