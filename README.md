# project1
deploying ec2 vpc alb sg using terraform for the secure and scalable infra to host the web application.
### Overview ###
In this project we create a vpc,securitygroup,ec2 instances and loadbalancer.
We use Terraform to automate the deployment of these resources in AWS. 
Terraform is an open-source infrastructure as code software tool that allows you to safely and predictably create, change, and manage infra.
The main components are:
- VPC with public and private subnets
- Security Group for EC2 Instances allowing HTTP/HTTPS access from anywhere
- EC2 instance running an Nginx web server
- Load Balancer that distributes incoming traffic across multiple EC2 instances

### Prerequisites ###
To run this project you need to have installed on your machine:
- [Terraform](https://www.terraform.io/downloads) version 0.13 or higher.
- Aws account to configure with terraform to access the provider which gives us the resources to build an infrastructure.
## vpc:
virtual private cloud is isolated area in the aws cloud where we can launch the resources in the public and private subnets.
Provides a secure and flexible environment for your applications.We'll define the IP address range for the VPC and configure its connectivity options.

## sg:
security group acts as the firewall and controls the inflow and outflow of the traffic for our ec2 instances.By using the rules   which port and protocal are allow to access the instances.

Inbound rules :It allows the necessary traffic to reach are access the instances eg:ssh(22) admin and http(80)/https(443) for web apps.
outbound rules:It allows the instances to communicate with the external services likes databases etc.

## alb:
Alb distributes the incoming traffic to the multiple ec2 instances ,it improves the availability and performance.
Listeners: It is responsible for accepting incoming client requests and forwarding them to one or more target groups.
target group is used by the ALB to route requests to the target(EC2).
health check is used by the Target Group.To monitor the health of each EC2 instance. If any instance fails the health check, it will be automatically deregistered from the Target Group to monitor the health of each EC2 instance.