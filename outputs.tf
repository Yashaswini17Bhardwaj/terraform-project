output "vpc_id" { value = module.vpc.vpc_id }
output "eks_endpoint" { value = module.eks.eks_cluster_endpoint }
output "rds_endpoint" { value = module.rds.rds_endpoint }
output "alb_dns" { value = module.load_balancer.alb_dns_name }
