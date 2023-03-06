### --- below vars needs for local.required_tags creation ---
project_name = "hd"
environment  = "prod"
### --- end of vars for local.required_tags creation ---
resource_tags = {
  author = "a.kharkin@skytechnic.aero"
}

### default create_folder = false
# create_folder = true
create_vpc = true
vpc_id     = ""
# subnet variables
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

# --------- test zone -----------------

# --------- end test zone -------------





