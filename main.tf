module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  az_count     = var.az_count
}
module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
  environment  = var.environment
  bucket_name  = var.s3_bucket_name
}

module "iam" {
  source = "./modules/iam"

  project_name  = var.project_name
  environment   = var.environment
  s3_bucket_arn = module.s3.bucket_arn
}
module "ec2" {
  source = "./modules/ec2"

  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  subnet_id             = module.vpc.public_subnet_ids[0]
  instance_type         = var.ec2_instance_type
  key_name              = var.ec2_key_name
  instance_profile_name = module.iam.ec2_instance_profile_name
  ssh_cidr_blocks       = var.ssh_cidr_blocks
}

module "rds" {
  source = "./modules/rds"

  project_name               = var.project_name
  environment                = var.environment
  vpc_id                     = module.vpc.vpc_id
  private_subnet_ids         = module.vpc.private_subnet_ids
  allowed_security_group_ids = [module.ec2.security_group_id]
  db_engine                  = var.db_engine
  db_instance_class          = var.db_instance_class
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
}
module "beanstalk" {
  source = "./modules/beanstalk"

  project_name               = var.project_name
  environment                = var.environment
  solution_stack             = var.beanstalk_solution_stack
  instance_security_group_id = module.ec2.security_group_id
  vpc_id                     = module.vpc.vpc_id
  public_subnet_ids          = module.vpc.public_subnet_ids
  private_subnet_ids         = module.vpc.private_subnet_ids
  ec2_instance_profile_name  = module.iam.beanstalk_ec2_instance_profile_name
  service_role_arn           = module.iam.beanstalk_service_role_arn
}
