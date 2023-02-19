terraform {
  required_version = ">= 1.2.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.8"
    }
  }
}

# export YC_TOKEN=$(yc iam create-token)\n export YC_CLOUD_ID=$(yc config get cloud-id)\n export YC_FOLDER_ID=$(yc config get folder-id)\n