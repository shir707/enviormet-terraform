enviorment = "prod"
location    = "East US"
size="Standard_DS2_v2"
sku="Standard_F2"
capacity    = 3
defaultNumVm=3
minVm=3

default_tags = {
  environment = "production"
  deployed_by = "terraform"
}
