output "subnets_config" {
    value = zipmap(data.aws_availability_zones.all_az.names, aws_default_subnet.default_subnets.*.id)
}

output "vpc_id" {
    value = aws_default_vpc.default_vpc.id
}