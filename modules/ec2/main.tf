resource "aws_instance" "demo" {
  count         = length(var.availability_zones)
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

  availability_zone      = var.availability_zones[count.index]
  vpc_security_group_ids = [aws_security_group.sg_pub.id]
  subnet_id              = var.subnets_ids[count.index]

  associate_public_ip_address = true

  user_data = var.user_data
}

resource "aws_security_group" "sg_pub" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port

    content {
      from_port   = tonumber(port.value)
      to_port     = tonumber(port.value)
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 8080
  #   to_port     = 8080
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}