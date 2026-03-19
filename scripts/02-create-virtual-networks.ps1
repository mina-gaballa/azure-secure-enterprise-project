# Create VNets

# Norway East Hub VNet
New-AzVirtualNetwork `
-Name "vnet-hub-noe-prod" `
-ResourceGroupName "rg-asep-hub-norwayeast" `
-Location "norwayeast" `
-AddressPrefix "10.0.0.0/16"

# Central India Workload VNet
New-AzVirtualNetwork `
-Name "vnet-workload-ind-prod" `
-ResourceGroupName "rg-asep-production-centralindia" `
-Location "centralindia" `
-AddressPrefix "10.1.0.0/16"

# Canada Central Workload VNet
New-AzVirtualNetwork `
-Name "vnet-workload-can-prod" `
-ResourceGroupName "rg-asep-production-canadacentral" `
-Location "canadacentral" `
-AddressPrefix "10.2.0.0/16"
