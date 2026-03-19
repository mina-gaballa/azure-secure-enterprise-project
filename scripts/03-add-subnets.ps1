# Add subnets to all VNets

# Get VNets
$hubVnet = Get-AzVirtualNetwork -Name "vnet-hub-noe-prod" -ResourceGroupName "rg-asep-hub-norwayeast"
$indVnet = Get-AzVirtualNetwork -Name "vnet-workload-ind-prod" -ResourceGroupName "rg-asep-production-centralindia"
$canVnet = Get-AzVirtualNetwork -Name "vnet-workload-can-prod" -ResourceGroupName "rg-asep-production-canadacentral"

# Hub VNet subnets
Add-AzVirtualNetworkSubnetConfig -Name "AzureFirewallSubnet" -AddressPrefix "10.0.1.0/24" -VirtualNetwork $hubVnet
Add-AzVirtualNetworkSubnetConfig -Name "AzureBastionSubnet" -AddressPrefix "10.0.2.0/24" -VirtualNetwork $hubVnet
Add-AzVirtualNetworkSubnetConfig -Name "snet-management" -AddressPrefix "10.0.3.0/24" -VirtualNetwork $hubVnet
$hubVnet = Set-AzVirtualNetwork -VirtualNetwork $hubVnet

# Central India subnets
Add-AzVirtualNetworkSubnetConfig -Name "snet-web" -AddressPrefix "10.1.1.0/24" -VirtualNetwork $indVnet
Add-AzVirtualNetworkSubnetConfig -Name "snet-app" -AddressPrefix "10.1.2.0/24" -VirtualNetwork $indVnet
Add-AzVirtualNetworkSubnetConfig -Name "snet-private-endpoints" -AddressPrefix "10.1.3.0/24" -VirtualNetwork $indVnet
$indVnet = Set-AzVirtualNetwork -VirtualNetwork $indVnet

# Canada Central subnets
Add-AzVirtualNetworkSubnetConfig -Name "snet-web" -AddressPrefix "10.2.1.0/24" -VirtualNetwork $canVnet
Add-AzVirtualNetworkSubnetConfig -Name "snet-app" -AddressPrefix "10.2.2.0/24" -VirtualNetwork $canVnet
Add-AzVirtualNetworkSubnetConfig -Name "snet-private-endpoints" -AddressPrefix "10.2.3.0/24" -VirtualNetwork $canVnet
$canVnet = Set-AzVirtualNetwork -VirtualNetwork $canVnet
