resource "aws_key_pair" "vprofile-key" {
  key_name   = "vprofilekey"
  public_key = file("../exercise1/dovekey.pub")

}

resource "aws_instance" "vprofile-bastion" {
  ami           = lookup(var.AMIS, var.REGION)
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  # count                  = 1
  availability_zone           = var.ZONE1
  associate_public_ip_address = "true"
  key_name                    = aws_key_pair.vprofile-key.key_name
  vpc_security_group_ids      = [aws_security_group.vprofile-bastion-sg.id]

  tags = {
    Name    = "vprofile-bastion"
    Project = "vprofile"
  }

  provisioner "file" {
    content     = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.vprofile-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "/tmp/vprofile-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/vprofile-dbdeploy.sh",
      "sudo /tmp/vprofile-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file("../exercise1/dovekey")
    host        = self.public_ip
  }

  depends_on = [aws_db_instance.vprofile-rds]

}


