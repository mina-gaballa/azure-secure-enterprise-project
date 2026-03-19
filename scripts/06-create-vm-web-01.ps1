# Create web VM 01 in Central India

New-AzVM `
-ResourceGroupName "rg-asep-production-centralindia" `
-Name "vm-web-01" `
-Location "centralindia" `
-VirtualNetworkName "vnet-workload-ind-prod" `
-SubnetName "snet-web" `
-SecurityGroupName "nsg-web-01" `
-PublicIpAddressName $null `
-OpenPorts @() `
-Credential (Get-Credential) `
-Image "Win2022AzureEdition" `
-Size "Standard_B2s_v2"
