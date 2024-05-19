

aks = {
  resource_group_name     = "aks-rg"
  location                = "West Europe"
  kubernetes_cluster_name = "example-aks1"
  dns_prefix              = "exampleaks1"
  node_count              = 1
  vm_size                 = "Standard_D2_v2"
  environment             = "Production"
}
