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

#default resource tags = {project = "hd", enviroment = "dev"}

### test zone
# --------- test zone -----------------
subnet_designer = {
  "zone" = {
    zones_value = [ "ru-central1-a", "ru-central1-b", "ru-central1-c" ]
  }
}
# --------- end test zone -------------





