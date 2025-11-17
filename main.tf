# Create a key pair (optional: update the public_key path if needed)
# Security Group allowing SSH
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

# EC2 Instance (No input required)
resource "aws_instance" "my_ec2" {
  ami           = "ami-0ecb62995f68bb549"   # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"                # DEFAULT (no user input)

#  key_name        = aws_key_pair.mykey.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyTerraformEC2"
  }
}
