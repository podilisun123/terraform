### ec2 ###
resource "aws_instance" "expense" {
  for_each = var.instance_names
  ami           = data.aws_ami.ami_info.id
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  instance_type = each.value

  tags = merge(
    var.common_tags,
    {
        Name = each.key
        Module = each.key
    }
  )
}

### sg ###
resource "aws_security_group" "allow_ports" {
    name        = var.sg_name
    description = var.sg_description

    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
            from_port        = ingress.value["port"]
            to_port          = ingress.value["port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["allowed_cidr"]
        }
        
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        
    }

    tags = {
        Name = "all ports"
    }
}
