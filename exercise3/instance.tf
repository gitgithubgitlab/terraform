resource "aws_key_pair" "anecdote-key" {
  key_name   = "dovekey"
  public_key = file("../exercise1/dovekey.pub")

}


output "Public_IP" {
  value = aws_instance.anecdote-inst.public_ip

}


resource "aws_instance" "anecdote-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dove-pub-1.id
  # count = 2
  
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.anecdote-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]


  tags = {
    Name    = "anecdote-instance"
    Project = "anecdote"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("../exercise1/dovekey")
    host        = self.public_ip

  }
}

