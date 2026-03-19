Azure Secure Enterprise Project - Code Package
Author: Mina Gaballa

Included in this package:
- PowerShell scripts for the commands that were used successfully in the project flow
- JSON configuration and inventory files for the final deployed environment

Files:
01-create-resource-groups.ps1
02-create-virtual-networks.ps1
03-add-subnets.ps1
04-create-global-vnet-peering.ps1
05-create-vm-admin-01.ps1
06-create-vm-web-01.ps1
07-create-vm-web-02.ps1
08-install-iis-on-web-servers.ps1
09-create-route-table-via-firewall.ps1
00-project-variables.json
10-portal-created-resources.json

Notes:
- Bastion, Azure Firewall, Application Gateway, Key Vault, and some monitoring settings were created and validated from the Azure Portal during the lab.
- Those manual resources are documented in 10-portal-created-resources.json.
- No unverified ARM or Bicep deployment templates were added here.
