data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-${var.environment}-ec2-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
<<<<<<< HEAD
    cidr_blocks = ["0.0.0.0/0"] # demo only - production e nijer IP diye restrict koro
  }
### ICMP enable
ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
}
=======
    cidr_blocks = ["0.0.0.0/0"] # restrict this to your IP in real usage
  }

>>>>>>> b58dcd0 ( nodejs update)
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-sg"
  }
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name != "" ? var.key_name : null
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
<<<<<<< HEAD
=======
  iam_instance_profile   = var.instance_profile_name
>>>>>>> b58dcd0 ( nodejs update)

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2"
  }
}
