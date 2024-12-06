# variable "ami_id" {
#   type        = string
#   default     = "ami-09c813fb71547fc4f"
#   description = "RHEL-9 Devops"
# }
# variable "instance_type" {
#     type = string
#     default = "t2.micro"
# }
variable "instance_names" {
    default = {
        db = "t2.small"
        frontend = "t2.micro"
        backend = "t2.micro"
    }
}
variable "common_tags" {
    type = map
    default = {
        ProjectName = "expense"
        Terraform = "true"
    }
}

### sg ###
variable "sg_name" {
    default = "allow_multiports"
}
variable "sg_description" {
    default = "Allow 22,80,8080,3306 ports"
}
# variable "ssh_port" {
#     type = number
#     default = 22
# }
# variable "ssh_protocol" {
#     default = "tcp"
# }
variable "cidr_block" {
    type = list(string)
    default = ["0.0.0.0/0"]
}
variable "inbound_rules" {
    type = list
    default = [
        {
            port = 22,
            allowed_cidr = ["0.0.0.0/0"]
            protocol = "tcp"    
        },
        {
            port = 80,
            allowed_cidr = ["0.0.0.0/0"]
            protocol = "tcp"   
        },
        {
            port = 8080,
            allowed_cidr = ["0.0.0.0/0"]
            protocol = "tcp"
        },
            
        {
            port = 3306,
            allowed_cidr = ["0.0.0.0/0"]
            protocol = "tcp"  
        }
    ]
    
}

# r53

variable "domain_name" {
    default = "sundardev.online"
}
variable "zone_id" {
    default = "Z075004716WYIRQW1RZW4"
}