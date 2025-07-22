output "eks_cluster_endpoint" { value = aws_eks_cluster.main.endpoint }
output "eks_cluster_name" { value = aws_eks_cluster.main.name }
output "eks_cluster_certificate_authority_data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}
output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.cluster.arn
}