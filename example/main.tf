module "yc_network_module" {
  source       = "git::https://github.com/l-e-g-o/yc_network_module.git?ref=v1.0.1"
  project_name = "main"
  environment  = "prod"
  resource_tags = {
    author = "your.email@here.com"
  }
  create_folder = true
  create_vpc    = true
  #vpc_id        = ""
  # subnet variables
  networks = {
    private = {
      base_cidr_block = "10.100.0.0/20"
    }
    public = {
      base_cidr_block = "10.200.0.0/20"
    }
  }
  subnets = {
    ru-central1-a = {
      number = 1
    }
    ru-central1-b = {
      number = 2
    }
    ru-central1-c = {
      number = 3
    }
  }
}   