#VPC Module - Output 
output "vpc_id" {
    description = "The ID of the VPC"
    value = aws_vpc.main.id
}
output "public_subnet_id" {
    description = "The ID of the public subnet"
    value = aws_subnet.public.id
}

output "private_subnet_ids" {
    description = "The IDs of the private subnets"
    value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "vpc_cidr"  {
    description = "The CIDR block of the VPC"
    value = var.vpc_cidr
}