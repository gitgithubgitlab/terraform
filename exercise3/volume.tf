resource "aws_ebs_volume" "vol-4-dove" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-dove"
  }

}


resource "aws_volume_attachment" "attch-vol-dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol-4-dove.id
  instance_id = aws_instance.anecdote-inst.id

}


