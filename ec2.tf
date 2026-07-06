#key pair(login)
resource "aws_key_pair" "My_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}
#VPC & Security Group
resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "my_security_group" {
    name = "automate-sg"
    description = "this will add a TF generated security group"
    vpc_id = aws_default_vpc.default.id               #interpolation

     
 #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }    

    ingress  {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }
    
    ingress  {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Notes app"
    }
     #outbound rules
    
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks =["0.0.0.0/0"]
        description ="all access open outbound"
    }

    tags = {
        Name = "automate-sg"
    }
}
# ec2 Instance
resource "aws_instance" "my_instance" {
  ami                    = "var.ec2_ami_id"
  instance_type          = "var.ec2_instance_type"
  key_name               = aws_key_pair.My_key.key_name

  vpc_security_group_ids = [
    aws_security_group.my_security_group.id
  ]

  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "TWS-Junoon-automate"
  }
}