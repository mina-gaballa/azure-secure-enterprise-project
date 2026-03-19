# Create UDR to send web subnet outbound traffic through Azure Firewall
# Firewall private IP used in the deployed environment: 10.0.1.4

$routeTable = New-AzRouteTable `
-Name "rt-web-via-firewall" `
-ResourceGroupName "rg-asep-production-centralindia" `
-Location "centralindia"

Add-AzRouteConfig `
-Name "default-to-firewall" `
-AddressPrefix "0.0.0.0/0" `
-NextHopType "VirtualAppliance" `
-NextHopIpAddress "10.0.1.4" `
-RouteTable $routeTable | Set-AzRouteTable

$vnet = Get-AzVirtualNetwork -Name "vnet-workload-ind-prod" -ResourceGroupName "rg-asep-production-centralindia"
$nsg = Get-AzNetworkSecurityGroup -Name "nsg-web-subnet-ind" -ResourceGroupName "rg-asep-production-centralindia"
$rt = Get-AzRouteTable -Name "rt-web-via-firewall" -ResourceGroupName "rg-asep-production-centralindia"

Set-AzVirtualNetworkSubnetConfig `
-Name "snet-web" `
-VirtualNetwork $vnet `
-AddressPrefix "10.1.1.0/24" `
-NetworkSecurityGroup $nsg `
-RouteTable $rt

Set-AzVirtualNetwork -VirtualNetwork $vnet
