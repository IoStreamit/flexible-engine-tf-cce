  resource "flexibleengine_cce_cluster_v3" "cce" {
    count                   = var.cce_enabled ? 1 : 0 
    name                    = var.cce_name
    cluster_type            = var.cce_type
    cluster_version         = var.cce_version
    flavor_id               = var.cce_idflavor
    vpc_id                  = var.cce_idvpc
    subnet_id               = var.cee_idsubnet
    container_network_type  = var.cce_container_network_type 
    authentication_mode     = var.cce_authentication_mode
    description             = var.cce_description
  }

  resource "flexibleengine_cce_node_pool_v3" "node_pool_cce" {
    for_each = {for node_pool in var.node_pool_cce :node_pool.node_pool_cce => node_pool }
    cluster_id               = each.value.node_pool_cluster_id
    name                     = each.value.node_pool_name
    os                       = each.value.node_pool_os
    initial_node_count       = each.value.node_pool_node_count
    flavor_id                = each.value.node_pool_node_flavor_id
    availability_zone        = each.value.node_pool_node_az
    key_pair                 = each.value.node_pool_node_keypair
    scall_enable             = each.value.node_pool_scall_enable
    min_node_count           = each.value.node_pool_min_node
    max_node_count           = each.value.node_pool_max_node
    scale_down_cooldown_time = each.value.node_pool_cooldown_time
    priority                 = each.value.node_pool_priority
    type                     = each.value.node_pool_type
    root_volumes = [
      {
        size              = 100
        type              = "SAS"
      }
    ]
    data_volumes = [
      {
        size       = 50
        type       = "SAS"
      }
    ]
  }