output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "pvt_subnet_ids" {
  value = module.vpc.private_subnets
}