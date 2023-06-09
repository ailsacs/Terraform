# creating security group.
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  
  ingress {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["single/range-ip"]
  }
  tags = {
  Name = "ssh"
  }
}



