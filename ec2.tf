resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.public.id

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_eip" "ansible_server_ip" {
  #count = 5
  #instance = aws_instance.web[count.index].id
    instance = aws_instance.web.id
    vpc      = true
}


