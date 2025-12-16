variable "AWS_REGION" {
  type    = string
  default = "us-west-2"
}

variable "AWS_TAGS" {
  type = map(string)

  default = {
    "Terraform"   = "true"
    "Environment" = "demo"
  }
}