provider "aws" {
  region = var.REGION

}


resource "aws_key_pair" "anecdote-key" {
  key_name   = "dovekey"
  public_key = file("../exercise1/dovekey.pub")

}


resource "aws_instance" "anecdote-inst" {
  ami                    = var.AMIS[var.REGION]
  
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.anecdote-key.key_name
  vpc_security_group_ids = ["sg-03e991b6f6d1a6687"]
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

