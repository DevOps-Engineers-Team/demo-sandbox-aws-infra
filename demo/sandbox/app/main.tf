module "default_vpc_subnets" {
  source      = "../../../modules/default-vpc-subnets"
}

module "ec2" {
  source      = "../../../modules/ec2"
  vpc_id = module.default_vpc_subnets.vpc_id
  user_data = data.template_file.ec2_user_data.rendered
  availability_zones = var.vpc_availability_zones
  sg_ports           = var.sg_ports
  subnets_ids = values(module.default_vpc_subnets.subnets_config)
}

module "alb" {
  source      = "../../../modules/alb"
  vpc_id = module.default_vpc_subnets.vpc_id
  security_group_id = module.ec2.security_group_id
  subnets_ids       = values(module.default_vpc_subnets.subnets_config)
  ec2_isntances_ids = module.ec2.ec2_isntances_ids
  alb_listener_port = var.alb_listener_port
  target_group_port = var.target_group_port
}
