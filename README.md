<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_resourcemanager_folder.main-folder](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder) | resource |
| [yandex_vpc_network.main-vpc](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet_creation](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_folder"></a> [create\_folder](#input\_create\_folder) | create new folder. default: false | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | create new folder. default: false | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | type of environment | `string` | `""` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | map из базовых сетей для распределения в зонах доступности | <pre>map(object({<br>    base_cidr_block = string<br>  }))</pre> | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | project name | `string` | `""` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | label for fast identity some project\_names | `map(string)` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | map из значений подсетей для базовых сетей из var.networks | <pre>map(object({<br>    number = number<br>  }))</pre> | <pre>{<br>  "ru-central1-a": {<br>    "number": 1<br>  },<br>  "ru-central1-b": {<br>    "number": 2<br>  },<br>  "ru-central1-c": {<br>    "number": 3<br>  }<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Enter vpc\_id. Default value = default in YC | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_active_labels"></a> [project\_active\_labels](#output\_project\_active\_labels) | lables that you are created |
| <a name="output_project_folder_id"></a> [project\_folder\_id](#output\_project\_folder\_id) | id of existing or created folder |
| <a name="output_project_subnets_id"></a> [project\_subnets\_id](#output\_project\_subnets\_id) | id's of created subnets |
| <a name="output_project_vpc_id"></a> [project\_vpc\_id](#output\_project\_vpc\_id) | id of existing or created vpc |
<!-- END_TF_DOCS -->