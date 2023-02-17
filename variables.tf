#----- labels for yc resources -----
variable "project_name" {
  description = "project name"
  type        = string
  default     = "main"
  # regexall return the COUNT of how many matches the regex found 0 == 0 > true
  validation {
    condition     = length(var.project_name) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.project_name)) == 0
    error_message = "The project_name tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "type of environment"
  type        = string
  default     = "dev"
  # regexall return the COUNT of how many matches the regex found 0 == 0 > true
  validation {
    condition     = length(var.environment) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.environment)) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens.ue"
  }
}

variable "resource_tags" {
  description = "label for fast identity some project_names "
  type        = map(string)
  default     = {}
}

variable "create_folder" {
  description = "create new folder. default: false"
  type        = bool
  default     = false
}

variable "create_vpc" {
  description = "create new folder. default: false"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "Enter vpc_id. Default value = default in YC"
  type = string
  default = " "
}

variable "yc_availability_zones" {
    description = "list of  yc availability zones"
    type = list
    default = [
        "ru-central1-a",
        "ru-central1-b",
        "ru-central1-c"
    ]
  
}



