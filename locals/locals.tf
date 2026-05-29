# we can't override values in locals, helpful: when t3.micro needed, not anything. can put in locals, 2ns example: tags
# we can use variables inside variables
# we can store functions and expressions

locals {
    instance_name = "${var.name}-${var.environment}"
    common_tags = {
        Project = "Roboshop"
        Terraform = "true"
        Environment = "dev"
    }
    instance_type = "t3.micro"
    ec2_final_tags = merge(local.common_tags, var.ec2_tags)
    ami_id = data.aws_ami.joindevops.id
}