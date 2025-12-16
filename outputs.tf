output "vpc_id" {
  value = module.vpc.vpc_id
}

output "pvt_subnet_ids" {
  value = module.vpc.private_subnets
}