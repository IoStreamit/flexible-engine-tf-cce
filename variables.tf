variable "cce_name" {
    type = string
    description = "name of cce cluster to be created"  
}

variable "cce_enabled" {
    type = bool
    description = "enable creation to create cce cluster"
    default = true 
}

variable "cce_type" {
    type = string
    description = "type of cce  to be crated"
}

variable "cce_version" {
    type = string
    default = ""
    description = "the class of cce cluster that is used by the cce"
}

variable "cce_idflavor" {
    type = string
    description = "the flavore type of cce to be created"
    default = ""
}

variable "cce_idvpc" {
    type = string
    description = "the id of vpc that is will be used to create the cce cluster"
    default = ""
}

variable "cee_idsubnet" {
    type = string
    description = "the id of the subnet that will be used to create the cluster"
    default = ""
}

variable "cce_container_network_type" {
    type = string
    description = "the plugin àf network used on the cce cluster "
    default = ""
}

variable "cce_authentication_mode" {
    type = string
    description = "the auth mode used on the cce cluster"
    default = ""
}

variable "cce_description" {
    type = string
    description = "description of the cce cluster usage"
    default = ""
}

variable "node_pool_cce" {
    type = list(object({
        node_pool_cluster_id        = string
        node_pool_name              = string,
        node_pool_os                = string,
        node_pool_node_count        = string,
        node_pool_node_flavor_id    = string,
        node_pool_node_az           = string,
        node_pool_node_keypair      = string,
        node_pool_scall_enable      = string,
        node_pool_min_node          = number,
        node_pool_max_node          = number,
        node_pool_cooldown_time     = number,
        node_pool_priority          = number,
        node_pool_type              = string
    }))
}