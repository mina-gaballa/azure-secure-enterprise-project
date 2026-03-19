# Install IIS and configure landing pages on both web VMs

Invoke-AzVMRunCommand `
-ResourceGroupName "rg-asep-production-centralindia" `
-Name "vm-web-01" `
-CommandId "RunPowerShellScript" `
-ScriptString @'
Install-WindowsFeature -Name Web-Server -IncludeManagementTools
Set-Content -Path "C:\inetpub\wwwroot\index.html" -Value "<h1>vm-web-01 is running IIS</h1>"
'@

Invoke-AzVMRunCommand `
-ResourceGroupName "rg-asep-production-centralindia" `
-Name "vm-web-02" `
-CommandId "RunPowerShellScript" `
-ScriptString @'
Install-WindowsFeature -Name Web-Server -IncludeManagementTools
Set-Content -Path "C:\inetpub\wwwroot\index.html" -Value "<h1>vm-web-02 is running IIS</h1>"
'@
