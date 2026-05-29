data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

}

data "aws_instance" "terraform_instances" {
 instance_id = "i-09b667285e823a12a"
}