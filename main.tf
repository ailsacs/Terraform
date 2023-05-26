provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-026c8acd92418196b"
  instance_type = "t2.micro"
  key_name = "challenges_aws"
  tags = {
    Name = "dev_${count.index}"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev_s3" {
  ami = "ami-026c8acd92418196b"
  instance_type = "t2.micro"
  key_name = "challenges_aws"  tags = {
    Name = "dev_s3"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = ["aws_s3_bucket.dev_s3"]
}

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

resource "aws_s3_bucket" "dev_s3" {
  bucket = "challenges-s3"
  acl    = "private"

  tags = {
    Name = "challenges-s3"
  }
}
