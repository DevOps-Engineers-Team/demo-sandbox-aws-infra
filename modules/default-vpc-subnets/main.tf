resource "aws_default_vpc" "default_vpc" {}

resource "aws_default_subnet" "default_subnets" {
    count = length(data.aws_availability_zones.all_az.names)
    availability_zone = data.aws_availability_zones.all_az.names[count.index]
}
