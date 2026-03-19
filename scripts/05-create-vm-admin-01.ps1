# Create admin VM in Norway East

New-AzVM `
-ResourceGroupName "rg-asep-management-norwayeast" `
-Name "vm-admin-01" `
-Location "norwayeast" `
-VirtualNetworkName "vnet-hub-noe-prod" `
-SubnetName "snet-management" `
-SecurityGroupName "nsg-admin-01" `
-PublicIpAddressName $null `
-OpenPorts @() `
-Credential (Get-Credential) `
-Image "Win2022AzureEdition" `
-Size "Standard_B2s_v2"
