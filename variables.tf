#----- labels for yc resources -----
variable "resource_tags" {
  description = "label for fast identity some project services "
  type        = map(string)
  default = {
    project    = "main",
    enviroment = "dev"
  }
  # regexall return the COUNT of how many matches the regex found 0 == 0 > true
  validation {
    condition     = length(var.resource_tags["project"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["project"])) == 0
    error_message = "The project tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }

  validation {
    condition     = length(var.resource_tags["enviroment"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["enviroment"])) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens.ue"
  }

  #   condition     = length(var.resource_tags["environment"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["environment"])) == 0


}

variable "create_folder" {
  description = "create new folder. default: false"
  type        = bool
  default     = false
}


# variable "vpc_name" {
#   description = "name of vpc"
#   type = string
# }



