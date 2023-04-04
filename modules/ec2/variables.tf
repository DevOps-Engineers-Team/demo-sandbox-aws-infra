variable "availability_zones" {}

variable "user_data" {}

variable "sg_ports" {
  type    = list(number)
  default = []
}

variable "vpc_id" {}

variable "subnets_ids" {}