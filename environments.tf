variable "root_password" {

    type = string
    default = "joca"
  
}


variable "cidr_blocks" {

    type = list(string)
    default = [ "172.31.0.0/16" ]
  
}

variable "key_name" {

    type = string
    default = "mykey"
  
}