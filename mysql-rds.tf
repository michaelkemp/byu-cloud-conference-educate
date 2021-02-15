resource "random_password" "rds-password" {
  length  = 32
  special = false
}

resource "aws_db_instance" "mysql" {
    for_each               = local.az_names
    availability_zone      = each.key
    identifier             = "mysql-rds-${each.key}"
    skip_final_snapshot    = true
    deletion_protection    = false
    allocated_storage      = 20
    storage_type           = "gp2"
    engine                 = "mysql"
    engine_version         = "5.7"
    instance_class         = var.rds_type
    username               = "admin"
    password               = random_password.rds-password.result
    db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
    vpc_security_group_ids = [aws_security_group.SSH-MYSQL.id]
    publicly_accessible    = true ## This is not a good idea
}

############ OUTPUT CONNECTION INFO ############
locals {
    mysqllogins = [
        for instance in aws_db_instance.mysql:
            "mysql --host=${instance.address} --port=3306 --user=admin --password"
    ]
}

output "rds-info" {
  value = <<-EOF
    
    # MySQL Password
    ${random_password.rds-password.result}
    
    # MySQL Login Strings
    ${join("\n",local.mysqllogins)}

  EOF
}
