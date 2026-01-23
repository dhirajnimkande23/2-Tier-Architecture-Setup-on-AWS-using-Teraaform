#Security Group Module
resource "aws_security_group" "web_sg" {
    name = var.web_sg_name
    description = "Security group for web Servers"
    vpc_id = var.vpc_id

ingress {
    description = "HTTP From anywhere"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "${var.project_name}-web-sg"
    Environment = var.environment
}
}

#Security Group for Database
resource "aws_security_group" "db" {
    name = "${var.project_name}-db-sg"
    description = "Security group for RDS Database"
    vpc_id = var.vpc_id
    
ingress {
    description = "MYSQL from web servers"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.web_sg.id]
}    
egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
    Name = "${var.project_name}-db-sg"
    Environment = var.environment   
    }

}
