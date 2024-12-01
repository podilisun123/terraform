### ec2 ###
resource "aws_instance" "dev" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = "t2.micro"

  tags = {
    Name = "dev"
    CreatedBy = "Sundar"
  }
}

### sg ###
resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow ssh traffic"

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    tags = {
        Name = "allow_ssh"
    }
}
