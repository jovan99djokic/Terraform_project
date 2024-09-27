resource "aws_instance" "web" {
  ami           = "ami-00f07845aed8c0ee7"
  instance_type = "t2.micro"
  key_name = aws_key_pair.local_key.key_name

  tags = {
    Name = "Terraform_App"
  }
  
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

}

resource "aws_key_pair" "local_key" {

  key_name = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
  
}


resource "aws_security_group" "web_ec2_security_group" {
  name        = "web_ec2_security_group"
  description = "Allow SSH inbound traffic"
  
  # Allow SSH inbound for allowed IP addressess
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }
}

