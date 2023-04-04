provider "aws" {
  region  = "eu-west-1"
  allowed_account_ids = [local.account_id]

  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/gh-oidc-role"
  }
}