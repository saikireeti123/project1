variable "vpc_cidr" {
  type        = string
  description = "dev vpc"
  default     = "168.2.0.0/16"
}
variable "subnets_cidr" {
  type    = list(string)
  default = ["168.2.1.0/24", "168.2.2.0/24"]
}
variable "subnet_names" {
  type        = list(string)
  description = "Names of subnets"
  default     = ["pub1", "pub2"]
}