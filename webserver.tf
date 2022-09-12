resource "aws_instance" "venci-server" {
  count                  = 2
  ami                    = "ami-0dcc0ebde7b2e00db"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.venci-pub-sg.id]
  subnet_id              = element(aws_subnet.venci-snet.*.id, count.index)
  tags = {
    Name = "venci-server-${count.index + 1}"
  }
  provisioner "file" {
    source      = "./provision.sh"
    destination = "/tmp/provision.sh"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("terraform-key.pem")
      host        = self.public_ip
    }

  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "/tmp/provision.sh"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("terraform-key.pem")
      host        = self.public_ip
    }
  }
}