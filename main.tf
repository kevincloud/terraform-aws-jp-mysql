resource "aws_db_subnet_group" "dbsubnets" {
    name = "db-subnet-${var.unit_prefix}"
    subnet_ids = var.subnet_ids

    tags = {
        Owner = var.owner
        Region = var.hc_region
        Purpose = var.purpose
        TTL = var.ttl
    }
}

resource "aws_db_instance" "mysql" {
    allocated_storage = var.allocated_storage
    storage_type = var.storage_type
    engine = "mysql"
    engine_version = "5.7"
    instance_class = var.instance_size
    name = var.name
    identifier = var.identifier
    db_subnet_group_name = aws_db_subnet_group.dbsubnets.name
    vpc_security_group_ids = [aws_security_group.mysql-sg.id]
    username = var.mysql_user
    password = var.mysql_pass
    skip_final_snapshot = true
    tags = var.tags
}

resource "aws_security_group" "mysql-sg" {
    name = "mysql-sg-${var.unit_prefix}"
    description = "mysql security group"
    vpc_id = var.vpc_id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = var.tags
}
