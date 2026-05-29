variable "name" {
    type = string
    default = "locals"
}

variable "environment" {
    type = string
    default = "demo"
}

# variable "instance_name" {
#     type = string
#     default = "${var.name}-${var.environment}"    #throws error, so we go for locals. Can't use varibales inside varibales
# }

variable "ec2_tags" {
    default = {
        Name = "locals-demo"
    }
}

variable "sg_tags" {
    default = {
        Name = "locals-demo"
    }
}