variable "vpc_id" {
  type = string
}
variable "ec2_names" {
  type    = list(string)
  default = ["dev1", "dev2"]
}
variable "sg_id" {
  type = string
}
variable "subnets" {
  type = list(string)
}