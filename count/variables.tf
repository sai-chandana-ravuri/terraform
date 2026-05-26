 variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue","user", "cart", "shipping", "payment", "frontend"]
 }

 variable "zone_id" {
    default = "Z08145131ZQYG4A7JX2E8"
 }

variable "domain_name" {
    default = "daws88c.online"
 }

 variable "fruits_list" {
   type = list(string)
   default = ["apple", "banana", "apple", "mango"]
 }

 variable "fruits_set" {
   type = set(string)
   default = ["apple", "banana", "apple", "mango"]
 }