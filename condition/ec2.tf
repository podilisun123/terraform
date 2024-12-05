### ec2 ###
resource "aws_instance" "dev" {
  count = length(var.instance_names)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = var.instance_names[count.index] == "db" ? "t3.micro" : "t2.micro"

  tags = {
    Name = var.instance_names[count.index]
    CreatedBy = "Sundar"
  }
}


