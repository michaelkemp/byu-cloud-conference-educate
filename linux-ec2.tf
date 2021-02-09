############ AMI ############
data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

############ EC2 INSTANCE ############
resource "aws_instance" "linux" {
  for_each      = aws_default_subnet.default
  ami           = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  tags = {
    Name = "Linux"
  }
  subnet_id                   = each.value.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.SSH.id]
  user_data                   = <<-EOF
    #!/bin/bash
    yum update -y && yum upgrade -y
  EOF
}

locals {
  logins = [
    for instance in aws_instance.linux:
      "ssh -i ${aws_key_pair.generated_key.key_name}.pem ec2-user@${instance.public_ip}"
  ]
}

############ OUTPUT NAT CONNECTION INFO ############
output "information" {
  value = <<-EOF
    # Change key security and log into NAT Instance
    chmod 400 ${aws_key_pair.generated_key.key_name}.pem
    
    # Log in to instances
    ${join("\n",local.logins)}

  EOF
}
