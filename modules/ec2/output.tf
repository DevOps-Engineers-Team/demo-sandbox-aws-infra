output "security_group_id" {
  value = aws_security_group.sg_pub.id
}

output "ec2_isntances_ids" {
  value = aws_instance.demo[*].id
}