resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
  #We will get self object here.
  # while creating/destroying(when = destroy) resource, we can apply it. But not when updating. 
  # We can run commands and scripts as well.
  # Can create multiple provisoners
  # If proviosers has any error, it stops execution, If we want to ignore errors - we have on_failure = continue
  provisioner "local-exec" {
    command = "echo '${self.private_ip}' > inventory.ini"
  }
  
  # Will be executed before destroying
  provisioner "local-exec" {
    when = destroy
    command = "echo 'Deleting the instance'"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo > inventory.ini"
  }

  provisioner "local-exec" {
    when = destroy
    command = "exit 1"
    on_failure = continue
  }

  #To use remote-exece, we should connect before it.
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [                          #inline is used for mutltiple lines
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = "destroy"
    inline = [                          #inline is used for mutltiple lines
      "sudo systemctl stop nginx"
    ]
  }

  tags = {
    Name = "Provisioners-demo"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_terraform-provisioners" #This name is for aws account
  description = "Allow TLS inbound traffic and all outbound traffic"

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls_terraform"
  }
}