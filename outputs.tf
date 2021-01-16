output "vpc_id" {
    value = var.vpc_enabled && length(flexibleengine_vpc_v1.vpc) > 0 ? flexibleengine_vpc_v1.vpc[0].id : null
    description = "Vpc id" 
}

output "subnets_ids" {
    value     = [for subnet in flexibleengine_vpc_subnet_v1.vpc_subnets : subnet.subnet_id]
    description = "Subnet ids"
}