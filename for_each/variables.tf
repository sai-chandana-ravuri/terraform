# variable instances {
#     type = map
#     default = {
#         mongodb = "t3.micro"
#         catalogue = "t3.micro"
#         cart = "t3.micro"
#     }
# }

variable instances {
    type = list
    default = [ "mongodb", "catalogue", "cart"]
}

 variable "zone_id" {
    default = "Z08145131ZQYG4A7JX2E8"
 }

variable "domain_name" {
    default = "daws88c.online"
 }