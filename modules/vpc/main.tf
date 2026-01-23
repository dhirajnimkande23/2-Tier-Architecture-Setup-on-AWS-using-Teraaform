# VPC Module
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "${var.project_name}-${var.environment}-vpc"
         
    }
}

#Public Subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "${var.region}a"

    tags = {
        Name = "${var.project_name}-${var.environment}-public-subnet"
    }
}
#Private Subnets for RDS (required at least 2 AZs)

resource "aws_subnet" "private_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr[0]
    availability_zone = "${var.region}a"

tags = {
    Name = "${var.project_name}-${var.environment}-private-subnet-1"
}
}

resource "aws_subnet" "private_2" {
    vpc_id= aws_vpc.main.id
    cidr_block = var.private_subnet_cidr[1]
    availability_zone = "${var.region}b"

    tags = {
        Name = "${var.project_name}-${var.environment}-private-subnet-2"
    }
}

#internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.project_name}-${var.environment}-igw"
    }
}

#Route Table association

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${var.project_name}-public-rt"
        Environment = var.environment
    }
}
#Route Table Association
resource "aws_route_table_association" "public_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}
