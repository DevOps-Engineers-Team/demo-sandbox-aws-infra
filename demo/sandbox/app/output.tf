# output "subnets_config" {
#     value = module.default_vpc_subnets.subnets_config
# }

# output "subnets_ids" {
#     value = values(module.default_vpc_subnets.subnets_config)
# }

# output "vpc_id" {
#     value = module.default_vpc_subnets.vpc_id
# }

output "caller_config" {
  value = data.aws_caller_identity.current
}
