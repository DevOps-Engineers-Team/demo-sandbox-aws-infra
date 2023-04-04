data "template_file" "ec2_user_data" {
  template = file("../../../templates/user-data-amazon.sh")
}

data "aws_caller_identity" "current" {}
