# Azure Secure Enterprise Project

A hands-on Azure infrastructure project demonstrating secure enterprise design using hub-and-spoke networking, Azure Bastion, Azure Firewall, Application Gateway with WAF, private access, and centralized monitoring across multiple regions.


## Overview

This project demonstrates the design and implementation of a secure Azure enterprise environment aligned with core concepts from **AZ-104**, **AZ-700**, and **AZ-500**.

The solution was built as a hands-on Azure lab to simulate a production-style enterprise deployment that combines:

- Azure administration
- Secure network design
- Protected workload hosting
- Centralized traffic inspection
- Private access to sensitive services
- Monitoring and operational visibility

The environment uses a **hub-and-spoke architecture** across multiple Azure regions, with secure management access, web workload protection, outbound traffic control, and private connectivity to platform services.


## Architecture

The project is designed around a **hub-and-spoke model**.

### Hub Region – Norway East
The hub network provides centralized management and security services:

- Azure Firewall
- Azure Bastion
- Shared connectivity and routing
- Administrative access to virtual machines

### Production Region – Central India
The production environment hosts the application workload and secure access components:

- Application Gateway with WAF
- Two backend web virtual machines
- Network Security Group protection
- User-defined route table to force outbound traffic through Azure Firewall
- Azure Key Vault with Private Endpoint

### Additional Region – Canada Central
An additional regional virtual network was deployed to extend the architecture and demonstrate multi-region network design.

### Core Design Components

- Hub-and-spoke virtual networking
- Global VNet peering
- Azure Bastion for secure RDP access
- Azure Firewall for outbound traffic control
- Application Gateway for Layer 7 load balancing
- IIS-based backend web servers
- Key Vault private access model
- Log Analytics workspace for monitoring


## Architecture Diagram

[View Image](./architecture/secure-hybrid-azure-environment-diagram-v1.png)

![Architecture Diagram](./architecture/secure-hybrid-azure-environment-diagram-v1.png)

## Implemented Azure Services

- Azure Virtual Networks
- Azure VNet Peering
- Azure Bastion
- Azure Firewall
- Azure Route Table (UDR)
- Azure Network Security Groups
- Azure Application Gateway
- Azure Web Application Firewall (WAF)
- Azure Virtual Machines
- Azure Key Vault
- Azure Private Endpoint
- Azure Log Analytics Workspace
- Microsoft Defender for Cloud


## Screenshots

### All Resources Overview
[View Image](./screenshots/azure-all-resources-overview.JPG)

![All Resources Overview](./screenshots/azure-all-resources-overview.JPG)

### Virtual Machines Overview
[View Image](./screenshots/azure-virtual-machines-overview.JPG)

![Virtual Machines Overview](./screenshots/azure-virtual-machines-overview.JPG)

### Virtual Networks Overview
[View Image](./screenshots/azure-virtual-networks-overview.JPG)

![Virtual Networks Overview](./screenshots/azure-virtual-networks-overview.JPG)

### Azure Bastion Connection to Admin VM
[View Image](./screenshots/azure-bastion-admin-vm-connection.JPG)

![Azure Bastion Admin VM Connection](./screenshots/azure-bastion-admin-vm-connection.JPG)

### Azure Bastion Connection to Web VM
[View Image](./screenshots/azure-bastion-web-vm-connection.JPG)

![Azure Bastion Web VM Connection](./screenshots/azure-bastion-web-vm-connection.JPG)

### Route Table via Azure Firewall
[View Image](./screenshots/azure-firewall-route-table-central-india.JPG)

![Route Table via Azure Firewall](./screenshots/azure-firewall-route-table-central-india.JPG)

### Azure Firewall Application Rule Collection
[View Image](./screenshots/azure-firewall-application-rule-collection.JPG)

![Azure Firewall Application Rule Collection](./screenshots/azure-firewall-application-rule-collection.JPG)

### Application Gateway Backend Health
[View Image](./screenshots/application-gateway-backend-health.JPG)

![Application Gateway Backend Health](./screenshots/application-gateway-backend-health.JPG)


## Deployment Steps

### 1. Create Resource Groups
Create dedicated resource groups for management, networking, production, security, and monitoring resources.

### 2. Deploy Virtual Networks
Deploy the required virtual networks across the selected Azure regions:

- Hub VNet in Norway East
- Production VNet in Central India
- Additional VNet in Canada Central

### 3. Configure Subnets
Create dedicated subnets for:

- AzureFirewallSubnet
- AzureBastionSubnet
- Management subnet
- Web subnet
- Private Endpoint subnet
- Application Gateway subnet

### 4. Configure Global VNet Peering
Establish hub-and-spoke connectivity between regions using VNet peering.

### 5. Deploy Management VM
Create the administrative virtual machine in the management subnet and validate secure access through Azure Bastion.

### 6. Deploy Web Virtual Machines
Deploy two backend web virtual machines in the production subnet.

### 7. Install IIS
Install IIS on both backend servers and configure custom default web pages for validation.

### 8. Deploy Application Gateway
Deploy Azure Application Gateway with WAF and configure:

- Frontend listener
- Backend pool
- Backend HTTP settings
- Routing rule
- Health validation

### 9. Deploy Azure Firewall
Deploy Azure Firewall in the hub network and configure outbound traffic control.

### 10. Create Route Table
Create and associate a route table to the production web subnet so outbound traffic is routed through Azure Firewall.

### 11. Configure Firewall Rules
Create firewall application rules to control outbound web access from the workload subnet.

### 12. Configure Private Access
Deploy Azure Key Vault with a Private Endpoint and validate private DNS resolution.

### 13. Enable Monitoring
Deploy Log Analytics and configure diagnostic settings for core resources.

## Example Deployment Scripts

The repository includes PowerShell scripts used during implementation, such as:

- `01-create-resource-groups.ps1`
- `02-create-virtual-networks.ps1`
- `03-add-subnets.ps1`
- `04-create-global-vnet-peering.ps1`
- `05-create-vm-admin-01.ps1`
- `06-create-vm-web-01.ps1`
- `07-create-vm-web-02.ps1`
- `08-install-iis-on-web-servers.ps1`
- `09-create-route-table-via-firewall.ps1`

Configuration values and deployment references are also included in:

- `00-project-variables.json`
- `10-portal-created-resources.json`

## Security Implementation

This project includes multiple security controls designed to reflect real-world Azure security practices:

- Azure Bastion for secure RDP access without exposing public management ports
- Azure Firewall for centralized outbound traffic filtering
- User-defined route table to direct subnet traffic through the firewall
- Network Security Group applied to the production web subnet
- Application Gateway with Web Application Firewall (WAF)
- Azure Key Vault for secure secret storage
- Private Endpoint for private-only Key Vault access
- Public network access disabled for Key Vault
- Microsoft Defender for Cloud enabled for security posture visibility
- Log Analytics integration for centralized monitoring and diagnostics

## Validation Performed

The following checks were completed during deployment and validation:

- Successful creation of core Azure resources
- Secure administrative access through Azure Bastion
- Successful deployment of `vm-admin-01`, `vm-web-01`, and `vm-web-02`
- Healthy backend status for both web servers in Application Gateway
- Route table successfully associated with the production web subnet
- Azure Firewall application rule collection configured and applied
- Private DNS resolution validated for Azure Key Vault
- Monitoring workspace deployed for log collection

## Key Learning Outcomes

This project strengthened practical skills in the following areas:

- Designing Azure hub-and-spoke architectures
- Implementing secure remote administration with Azure Bastion
- Configuring global VNet peering across regions
- Deploying and validating Azure Application Gateway with WAF
- Routing workload subnet traffic through Azure Firewall
- Applying subnet-level protection using NSGs and UDRs
- Deploying Azure Key Vault with Private Endpoint integration
- Understanding Azure private DNS behavior for private services
- Organizing Azure deployments in a professional GitHub portfolio format
- Documenting real deployment evidence for technical review and recruiter visibility



## Author

**Mina Gaballa**  
Cloud and System Administration Engineer  
