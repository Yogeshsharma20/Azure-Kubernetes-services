# main.tf
resource "azurerm_resource_group" "example" {
  name     = var.aks.resource_group_name
  location = var.aks.location
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks.kubernetes_cluster_name
  location            = var.aks.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = var.aks.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.aks.node_count
    vm_size    = var.aks.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.aks.environment
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive = true
}
