provider "aws"{
    region = "ap-southeast-2"
}

module "webserver_cluster" {
  source = "./modules/services/webserver-cluster"

  cluster_name = "webservers-STAGE"
  instance_type = "t2.micro"
  min_size = 2
  max_size = 2

}



module "webserver_cluster_PROD" {
  source = "./modules/services/webserver-cluster"

  cluster_name = "webservers-PROD"
  instance_type = "t2.micro"
  min_size = 3
  max_size = 5

}

output "clb_dns_name" {
  value       = module.webserver_cluster.clb_dns_name
  description = "The domain name of the load balancer"
}



