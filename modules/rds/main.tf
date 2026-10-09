resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
<<<<<<< HEAD
  description = "Allow DB access only from EC2 SG"
=======
  description = "Allow DB access from EC2 SG"
>>>>>>> b58dcd0 ( nodejs update)
  vpc_id      = var.vpc_id

  ingress {
    description     = "DB access from app SG"
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = var.allowed_security_group_ids
  }
<<<<<<< HEAD
  ingress {
    description = "all traffic from public network"

    from_port = var.db_port
    to_port   = var.db_port
    
    protocol  = "tcp"
    cidr_blocks = ["103.209.40.213/32"]
  }
  # touhid
  ingress {
    description = "all traffic from public network"

    from_port = var.db_port
    to_port   = var.db_port
    
    protocol  = "tcp"
    cidr_blocks = ["103.94.216.34/32"]

  }
=======

>>>>>>> b58dcd0 ( nodejs update)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-rds-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier             = "${var.project_name}-${var.environment}-db"
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
<<<<<<< HEAD
  publicly_accessible    = true
=======
  publicly_accessible    = false
>>>>>>> b58dcd0 ( nodejs update)
  multi_az               = false

  tags = {
    Name = "${var.project_name}-${var.environment}-db"
  }
}
