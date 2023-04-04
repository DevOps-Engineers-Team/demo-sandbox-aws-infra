variable "security_group_id" {}

variable "subnets_ids" {
  type = list(string)
}

variable "ec2_isntances_ids" {
  type = list(string)
}

variable "vpc_id" {}

variable "alb_listener_port" {
  type = string
}

variable "target_group_port" {
  type = number
}
