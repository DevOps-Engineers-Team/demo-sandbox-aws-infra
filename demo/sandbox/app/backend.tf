### Backend

terraform {
  backend "s3" {
    bucket         = "witold-slawko-demo-ks-terraform-backend"
    key            = "infra/demo/sandbox/application/terraform.state"
    region         = "eu-west-1"
    dynamodb_table = "demo-sandbox-terraform-lock"
    role_arn = "arn:aws:iam::512632984379:role/gh-oidc-role"
  }
}
