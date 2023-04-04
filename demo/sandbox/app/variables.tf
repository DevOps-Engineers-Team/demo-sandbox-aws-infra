locals {
  app_name    = basename(dirname(dirname(path.cwd)))
  environment = basename(dirname(path.cwd))
  account_id  = data.aws_caller_identity.current.account_id
}

variable "vpc_cidr" {
  default = "10.83.0.0/16"
}

variable "vpc_availability_zones" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "sg_ports" {
  type    = list(number)
  default = [80]
}

variable "alb_listener_port" {
  type    = string
  default = "80"
}

variable "target_group_port" {
  type    = number
  default = 80
}