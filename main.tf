# Create a key pair (optional: use your existing key)
resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("~/.ssh/id_rsa.pub")   # update path if needed
}

# Security group allowing SSH
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0ecb62995f68bb549"   # Amazon Linux 2 (Mumbai) – update if needed
  instance_type = "t2.micro"

  key_name      = aws_key_pair.mykey.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyTerraformEC2"
  }
}
