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
    cluster_id               = var.cluster_id
    name                     = var.node_pool_name
    os                       = var.node_pool_os
    initial_node_count       = var.node_pool_node_count
    flavor_id                = var.node_pool_node_flavor_id
    availability_zone        = var.node_pool_node_az
    key_pair                 = var.node_pool_node_keypair
    scall_enable             = var.node_pool_scall_enable
    min_node_count           = var.node_pool_min_node
    max_node_count           = var.node_pool_max_node
    scale_down_cooldown_time = var.node_pool_cooldown_time
    priority                 = var.node_pool_priority
    type                     = var.node_pool_type

    dynamic "root_volume" {
      for_each = var.root_volumes
      content {
        size       = root_volume.value.size
        volumetype = root_volume.value.type
      }
    }

    dynamic "data_volumes" {
      for_each = var.datas_volumes
      content {
        size       = root_volume.value.size
        volumetype = root_volume.value.type
      }
    }
  }