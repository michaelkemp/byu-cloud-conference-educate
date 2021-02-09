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

############ EC2 INSTANCES ############
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
  vpc_security_group_ids      = [aws_security_group.SSH-MYSQL.id]
  user_data                   = <<-EOF
    #!/bin/bash
    yum update -y && yum upgrade -y
  EOF
}

############ OUTPUT CONNECTION INFO ############
locals {
  ec2logins = [
    for instance in aws_instance.linux:
      "ssh -i ${aws_key_pair.generated_key.key_name}.pem ec2-user@${instance.public_ip}"
  ]
}

output "ec2-info" {
  value = <<-EOF
  
    # Change key security to log into Instances
    chmod 400 ${aws_key_pair.generated_key.key_name}.pem
    
    # EC2 Login Strings
    ${join("\n",local.ec2logins)}

  EOF
}
