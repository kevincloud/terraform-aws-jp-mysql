variable "name" {
    type = string
}

variable "unit_prefix" {
    type = string
}

variable "allocated_storage" {
    type = number
    default = 10
}

variable "storage_type" {
    type = string
    default = "gp2"
}

variable "instance_size" {
    type = string
}

variable "identifier" {
    type = string
}

variable "subnet_ids" {
    type = list(string)
}

variable "mysql_user" {
    type = string
}

variable "mysql_pass" {
    type = string
}

variable "tags" {
    type = map(string)
    default = {}
}

variable "vpc_id" {
    type = string
}