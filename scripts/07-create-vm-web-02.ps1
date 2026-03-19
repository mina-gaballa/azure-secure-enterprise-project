# Create web VM 02 in Central India

New-AzVM `
-ResourceGroupName "rg-asep-production-centralindia" `
-Name "vm-web-02" `
-Location "centralindia" `
-VirtualNetworkName "vnet-workload-ind-prod" `
-SubnetName "snet-web" `
-SecurityGroupName "nsg-web-02" `
-PublicIpAddressName $null `
-OpenPorts @() `
-Credential (Get-Credential) `
-Image "Win2022AzureEdition" `
-Size "Standard_B2s_v2"
