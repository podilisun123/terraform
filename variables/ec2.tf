### ec2 ###
resource "aws_instance" "dev" {
  ami           = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_type

  tags = var.tags
}

### sg ###
resource "aws_security_group" "allow_ssh" {
    name        = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.ssh_protocol
        cidr_blocks      = var.cidr_block
        
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        
    }

    tags = {
        Name = "allow_ssh"
    }
}
