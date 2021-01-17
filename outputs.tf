output "cluster_id" {
    value = var.cce_enabled && length(flexibleengine_cce_cluster_v3.cce) > 0 ? flexibleengine_cce_cluster_v3.cce[0].id : null
    description = "Vpc id" 
}

output "node_pool_cce_ids" {
    value     = [for node_pool in flexibleengine_cce_node_pool_v3.node_pool_cce : node_pool.id]
    description = "node pools ids"
}