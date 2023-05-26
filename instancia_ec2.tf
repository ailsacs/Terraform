#Esse plan traz variados tipos de instancias ec2 t2.micro com diversos sistemas operacionais.


#with this resource, you start an instance t2.micro(standard), Ubuntu OS-LTS

resource "aws_instance" "input instance name" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "${resource.[1]}"
  }
  vpc_security_group_ids = ["aws_security_group.id or ${env.security_group.id}"]
}

#t2.micro, windowns server

resource "aws_instance" "input instance name" {
  ami = "ami-0d86c69530d0a048e"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "${resource.[1]}"
  }
  vpc_security_group_ids = ["aws_security_group.id or ${env.security_group.id}"]
}


#t2.micro, Red hat

resource "aws_instance" "input instance name" {
  ami = "ami-026ebd4cfe2c043b2"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "${resource.[1]}"
  }
  vpc_security_group_ids = ["aws_security_group.id or ${env.security_group.id}"]
}



