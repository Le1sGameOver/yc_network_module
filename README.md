<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.86.0 |

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
| <a name="input_networks"></a> [networks](#input\_networks) | map for base network subnets | <pre>map(object({<br>    base_cidr_block = string<br>  }))</pre> | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | project name | `string` | `""` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | label for fast identity some project\_names | `map(string)` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | zone name + number for subntes creation in each av zone | <pre>map(object({<br>    number = number<br>  }))</pre> | <pre>{<br>  "ru-central1-a": {<br>    "number": 1<br>  },<br>  "ru-central1-b": {<br>    "number": 2<br>  },<br>  "ru-central1-c": {<br>    "number": 3<br>  }<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | enter vpc\_id. default value = default in YC | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_active_labels"></a> [project\_active\_labels](#output\_project\_active\_labels) | lables that you are created |
| <a name="output_project_folder_id"></a> [project\_folder\_id](#output\_project\_folder\_id) | id of existing or created folder |
| <a name="output_project_subnets_cidr"></a> [project\_subnets\_cidr](#output\_project\_subnets\_cidr) | cidr blocks of created subnets |
| <a name="output_project_subnets_id"></a> [project\_subnets\_id](#output\_project\_subnets\_id) | id's of created subnets |
| <a name="output_project_subnets_name"></a> [project\_subnets\_name](#output\_project\_subnets\_name) | name of created subnets |
| <a name="output_project_vpc_id"></a> [project\_vpc\_id](#output\_project\_vpc\_id) | id of existing or created vpc |
<!-- END_TF_DOCS -->

<!-- BEGIN_EXPLANATION -->
## Logic of behavior

<mxfile host="app.diagrams.net" modified="2023-03-17T09:51:37.573Z" agent="5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36" etag="IBHpSLhMyTnK9mZMoFtv" version="21.0.6" type="device"><diagram name="Page-1" id="HUajjNb3lTYVEzk3k1bp">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</diagram></mxfile>
<!-- END_EXPLANATION -->
