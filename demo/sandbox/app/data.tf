data "template_file" "ec2_user_data" {
  template = file("../../../templates/user-data-amazon.sh")
}
