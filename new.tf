provider "aws" {
  region = var.myRegion
}

resource "aws_instance" "vm" {
  ami = var.myami
  instance_type = var.myinstancetype
  key_name= var.mykeyname
  vpc_security_group_ids = [aws_security_group.SG_OMARa.id]
  tags = {
    Name = "hamada"
  }
}

resource "aws_security_group" "SG_OMARa" {
  name        = "SG_OMARa"
  description = "Allow ssh only"
 

  ingress {
    description      = "TLS from VPC"
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
    Name = "allow_tls"
  }
}






resource "aws_key_pair" "deployer" {
  key_name   = var.mykeyname
  public_key ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCOb92mV9+PLBp/SoTUpU5Mq16MqTU5bmPIR9XSOxxqlHudQrkHwA4PA6+QHgfJ58ULz3MIaUQQ42fs+ZakkcGPGT9jo6dI6IN+2j0xhxR+NFobGdBY0vuN5BGjHaLyx7TfV0bFoBo/dy1zdJkIzToojgBtxpJnt43o8n2/DzwW793ewSLlL5nD1HmrnDAZM3VrsHOwHpaTlXJaXLfNbirC/PRfGLyc9CQP/CYHCA4N+/fu8X2mLyFCfALYDJxiNJoMpjqpMHBmeO8ygBd8rup0dyE+wrr/lWo8zzHmSpAdhKeY8syEbeFRKioLW54j5mW7gL8Nps0F/jlw3mjNiuIL imported-openssh-key"
}








