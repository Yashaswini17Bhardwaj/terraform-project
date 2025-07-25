output "vpc_id" { 
    value = aws_vpc.main.id 
}
output "public_subnet_ids" { 
    value = aws_subnet.public[*].id  
}
output "private_subnet_ids" { 
    value = aws_subnet.private[*].id 
}
output "eip_public_ip" {
  value = aws_eip.nat.public_ip
}
output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}
