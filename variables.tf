variable "vpc_name" {
    type = string
    description = "name of virtual private cloud to be created"  
}

variable "vpc_enabled" {
    type = bool
    description = "enable creation to create vpc"
    default = true 
}

variable "vpc_region" {
    type = string
    description = "region of vpc containing the vpc"
}

variable "vpc_cidr" {
    type = string
    description = "the class less internet domaine routring block that is used by the vpc"
    default = "192.168.0.0/24"
}

variable "vpc_subnets" {
    type = list(object({
        subnet_name       = string,
        subnet_cidr       = string,
        subnet_gateway_ip = string,
        subnet_availability_zone = string,
        subnet_dhcp_enable = optional(bool),
        subnet_primary_dns = optional(string),
        subnet_secondary_dns = optional(string) 
    }))
    description = "create the subnets of the vpc"
    default = []
}