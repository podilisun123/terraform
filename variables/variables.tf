variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "RHEL-9 Devops"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "tags" {
    type = map
    default = {
        Name = "dev"
        CreatedBy = "Sundar"
    }
}

### sg ###
variable "sg_name" {
    default = "allow_ssh"
}
variable "sg_description" {
    default = "Allow ssh traffic"
}
variable "ssh_port" {
    type = number
    default = 22
}
variable "ssh_protocol" {
    default = "tcp"
}
variable "cidr_block" {
    type = list(string)
    default = ["0.0.0.0/0"]
}