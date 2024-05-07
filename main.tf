module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
  subnet_names = var.subnet_names
}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
module "ec2" {
  source  = "./modules/ec2"
  sg_id   = module.sg.sg_id
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.subnet_id
}
module "alb" {
  source    = "./modules/alb"
  vpc_id    = module.vpc.vpc_id
  subnets   = module.vpc.subnet_id
  sg_id     = module.sg.sg_id
  instances = module.ec2.ec2_id
}