# default create_folder = false
# create_folder = true
create_vpc = true
project_name = "main"
environment  = "prod"
vpc_id       = ""

#default resource tags = {project = "hd", enviroment = "dev"}

private_subnet_cidr_blocks = [
    "10.42.0.0/24",
    "10.42.1.0/24",
    "10.42.2.0/24"
]
