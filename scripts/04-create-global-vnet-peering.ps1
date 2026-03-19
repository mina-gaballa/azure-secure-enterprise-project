# Create global VNet peering

$hubVnet = Get-AzVirtualNetwork -Name "vnet-hub-noe-prod" -ResourceGroupName "rg-asep-hub-norwayeast"
$indVnet = Get-AzVirtualNetwork -Name "vnet-workload-ind-prod" -ResourceGroupName "rg-asep-production-centralindia"
$canVnet = Get-AzVirtualNetwork -Name "vnet-workload-can-prod" -ResourceGroupName "rg-asep-production-canadacentral"

# Hub -> India
Add-AzVirtualNetworkPeering `
-Name "peer-hub-to-ind" `
-VirtualNetwork $hubVnet `
-RemoteVirtualNetworkId $indVnet.Id `
-AllowForwardedTraffic

# India -> Hub
Add-AzVirtualNetworkPeering `
-Name "peer-ind-to-hub" `
-VirtualNetwork $indVnet `
-RemoteVirtualNetworkId $hubVnet.Id `
-AllowForwardedTraffic

# Hub -> Canada
Add-AzVirtualNetworkPeering `
-Name "peer-hub-to-can" `
-VirtualNetwork $hubVnet `
-RemoteVirtualNetworkId $canVnet.Id `
-AllowForwardedTraffic

# Canada -> Hub
Add-AzVirtualNetworkPeering `
-Name "peer-can-to-hub" `
-VirtualNetwork $canVnet `
-RemoteVirtualNetworkId $hubVnet.Id `
-AllowForwardedTraffic
