output "alb_sg_id" { value = aws_security_group.alb_sg.id }
output "eks_sg_id" { value = aws_security_group.eks_sg.id }
output "rds_sg_id" { value = aws_security_group.rds_sg.id }
