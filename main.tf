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
}


