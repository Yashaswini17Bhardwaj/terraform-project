module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source             = "./modules/eks"
  eks_cluster_name   = var.eks_cluster_name
  private_subnet_ids = module.vpc.private_subnet_ids
  node_instance_type = var.node_instance_type
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source             = "./modules/rds"
  private_subnet_ids = module.vpc.private_subnet_ids
  db_instance_class  = var.db_instance_class
  db_name            = var.db_name
  db_username        = var.db_username
  db_password_secret_arn  = var.db_password_secret_arn
  rds_sg_id          = module.security_groups.rds_sg_id
}

module "load_balancer" {
  source            = "./modules/load_balancer"
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  vpc_id            = module.vpc.vpc_id
}

module "ingress" {
  source    = "./modules/ingress"
  namespace = "staging"   
}
