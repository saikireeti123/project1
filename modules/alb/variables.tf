variable "sg_id" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "instances" {
  type = list(string)
}