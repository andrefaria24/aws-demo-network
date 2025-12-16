# Create a VPC with public and private subnets across two availability zones
module "vpc" {
  source  = "app.terraform.io/acfaria-hashicorp/vpc/aws"
  version = "1.0.0"

  name = "vpc-demo"
  cidr = "10.11.0.0/16"

  azs             = ["${var.AWS_REGION}a", "${var.AWS_REGION}b"]
  private_subnets = ["10.11.1.0/24", "10.11.2.0/24"]
  public_subnets  = ["10.11.11.0/24", "10.11.12.0/24"]

  create_igw         = true
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "demo"
  }
}

# Create routes in private route tables to direct internet-bound traffic to the IGW
resource "aws_route" "private_default_to_igw" {
  for_each               = toset(module.vpc.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.vpc.igw_id
}