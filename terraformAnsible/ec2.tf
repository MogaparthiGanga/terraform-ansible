resource "aws_instance" "nginx" {
  ami = "ami-04b70fa74e45c3917"
  subnet_id = aws_subnet.subnet.id
  instance_type = "t2.micro"
  key_name = local.key_name
  security_groups = [aws_security_group.sg.id]

  tags = {
    Name = "terraformAnsibleNginx"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = aws_instance.nginx.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.nginx.public_ip}, --private-key ${local.private_key_path} nginx.yaml"
  }
}

locals {
  private_key_path = "~/Downloads/terraformAnsible.pem"
  ssh_user         = "ubuntu"
  key_name = "terraformAnsible"
}