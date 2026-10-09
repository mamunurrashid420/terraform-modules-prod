aws_region   = "us-east-1"
project_name = "myapp"
environment  = "dev"

vpc_cidr          = "10.0.0.0/16"
az_count          = 2
ec2_instance_type = "t3.micro"
ec2_key_name      = "invizo"

db_engine         = "mysql"
db_instance_class = "db.t3.micro"
db_name           = "appdb"
db_username       = "admin"
db_password       = "yourpassword"

# beanstalk_solution_stack = "64bit Amazon Linux 2023 v4.1.1 running Node.js 20"
beanstalk_solution_stack = "64bit Amazon Linux 2023 v6.11.10 running Node.js 22"
s3_bucket_name           = "myapp-dev-unique-bucket-name-123456"
