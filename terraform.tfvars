### --- below vars needs for local.required_tags creation ---
project_name = "hd"
environment = "prod"
### --- end of vars for local.required_tags creation ---
resource_tags = {
  author = "a.kharkin@skytechnic.aero"
}

### default create_folder = false
# create_folder = true
create_vpc = true
vpc_id       = ""
yc_availability_zones = [ "ru-central1-a", "ru-central1-b", "ru-central1-c" ]
# v4_cidr_blocks = [ "10.22.0.0/24", "10.22.1.0/24", "10.22.2.0/24" ]




#default resource tags = {project = "hd", enviroment = "dev"}

### test zone
# --------- test zone -----------------
networks = {
  private = {
    base_cidr_block = "10.10.0.0/20"
  }
  public = {
    base_cidr_block = "10.20.0.0/20"
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
# --------- end test zone -------------





