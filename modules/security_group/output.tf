
output "aws_security_group_web_sg_id" {
    description = "The ID of the web security group"
    value       = aws_security_group.web_sg.id
}

output "aws_security_group_db_id" {
    description = "The ID of the database security group"
    value       = aws_security_group.db.id
}