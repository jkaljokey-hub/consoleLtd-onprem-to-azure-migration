# Overview

Console.Ltd is a small trading company with approximately 25 employees operating entirely from a single on-premises office environment.

The infrastructure was aging, difficult to scale, lacked centralized monitoring, and required significant manual maintenance. To modernize the environment and improve reliability, scalability, monitoring, and disaster recovery readiness, the company decided to migrate its workloads to Microsoft Azure.


# Project Objectives
- Modernize legacy on-premises infrastructure
- Improve scalability and reliability
- Centralize monitoring and observability
- Reduce infrastructure management overhead
- Enable cloud-based disaster recovery capabilities
- Migrate workloads with minimal application redesign


### Estimated Monthly Azure Cost
| Service                       | Estimated Monthly Cost |
| ----------------------------- | ---------------------- |
| Azure VM (B2s Windows Server) | $30–$36                |
| Azure SQL Database            | ~$5                    |
| Azure Files                   | $2–$5                  |
| Azure Backup                  | $5–$10                 |
| Public IP                     | $2–$3                  |
| Azure Monitor / Log Analytics | $3–$10                 |

Total Estimated Monthly Cost

```~$50–$70/month ```


# Architecture Diagram

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/ChatGPT%20Image%20May%2024,%202026,%2003_18_11%20PM.png?raw=true)


# Project Structure

The project is divided into three major sections:

1. On-Prem Infrastructure
2. Migration Process
3. Azure Cloud Infrastructure


## Part 1 — On-Prem Infrastructure
### Phase 1 — Environment Preparation
Infrastructure Setup

The on-premises lab environment was built using Oracle VirtualBox to simulate a small enterprise infrastructure.

Components:-
- Vbox Internal Virtual Network
- Windows Server 2022
- Windows 10 Client Machine
Purpose

This environment simulates a real small-business infrastructure before migration to Azure.

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/vbox.png?raw=true)
![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/ServerManager.png?raw=true)
![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/provejoining.png?raw=true)



### Phase 2 — Active Directory & DNS
Active Directory Deployment

Active Directory Domain Services (AD DS) was configured to provide centralized identity management.

DNS Configuration:
``` BakryRoot.com   ```

Organizational Structure:-
Created:

-- Users
-- Security Groups
-- Organizational Units

Purpose

The domain environment was created to simulate enterprise identity management before hybrid cloud integration.

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/LocalServer.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/DNSOU.png?raw=true)




### Phase 3 — File Share Infrastructure
File Services Configuration

A centralized file-sharing service was deployed on Windows Server.

Shared Folder :-
``` CompanyData ```
Configurations :-
-- SMB Share
-- NTFS Permissions
-- User Access Control
Access Validation :-
``` \\WinServ ```
Purpose :-

This phase simulates departmental shared storage commonly used in enterprise environments.

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/FileshareTorageService.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/fileshareappear.png?raw=true)



### Phase 4 — ERP Database Environment
SQL Server Deployment

Installed:

-- SQL Server Express
-- SQL Server Management Studio (SSMS)
-- Database Creation
``` ERP_DB```
Database Objects

Created:

- Customer table
- Sample ERP records
Purpose

This database simulates a lightweight ERP backend hosted on-premises before migration to Azure SQL Database.


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/SSMSconnectionwindow.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/TablesCustomers.png?raw=true)

### Phase 5 — ERP IIS Web Application
IIS Deployment

Installed:

- IIS Web Server
- .NET Framework
- ASP.NET Components
ERP Web Application

Created and deployed:

```Default.html```
Purpose

This phase simulates an internally hosted ERP web application running on IIS before migration to Azure Virtual Machines.




![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/IIS-ERPWEB.png?raw=true)


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/browsererpbk.png?raw=true)

------------------------------------------------------------------------------------------------------


## Part 2 — Migration Process
### Phase 6 — Hybrid Identity Migration
Microsoft Entra Connect Deployment:-

Microsoft Entra Connect was deployed using Express Settings to synchronize on-premises identities with Microsoft Entra ID.

Configuration Steps :-
- Connected to Microsoft Entra ID
- Connected to local AD DS
- Validated synchronization configuration
- Verified synchronized users in Azure
* Important Technical Note

Correct system time synchronization was required before successful Microsoft Entra Connect configuration.

Purpose

This phase enabled hybrid identity management and centralized cloud authentication.



![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/closeronprimeconnection.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/wowsuccerrorrno.png?raw=true)


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/syncAD.png?raw=true)

### Phase 7 — SQL Database Migration
Azure SQL Deployment

Created:

- Azure SQL Logical Server
- Azure SQL Database
Firewall Configuration

Configured Azure SQL firewall rules to allow on-premises connectivity during migration.

Migration Strategy


Deploy to Azure SQL Database

Used for:

- Lightweight databases
- Faster migration workflows
Selected Method

The database was migrated using:

``` Deploy Database to Microsoft Azure SQL Database```
Migration Process :-
- Connected SSMS to local SQL Server
```Tasks → Deploy Database to Microsoft Azure SQL Database ```
Provided:
- Azure SQL Server Name
- Username
- Password
Validated successful deployment
Connection String Update

After migration, the ERP application connection string was updated to use Azure SQL Database.
```
Server=tcp:consoleltd.database.windows.net,1433;  
Database=ERP_DB;
User ID=sqladmin;
Password=YourPassword123!; 
Encrypt=true;
TrustServerCertificate=false;
Connection Timeout=30;
```
Result :-

The ERP database was successfully migrated from on-premises SQL Server to Azure SQL Database.

Add screenshots here

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/connectingonprimesqlstep7.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/CompleteDbToAzureDb.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/CompletedSyncDatabaseOnprime.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/REAlDVAZURE.png?raw=true)

### Phase 8 — IIS ERP Application Migration
Migration Strategy

A Lift-and-Shift migration strategy was selected to minimize application redesign and accelerate migration.

Azure Infrastructure

Created:

-  Hub Virtual Network
-  Azure Virtual Machine
-  NSG Rules

Azure VM :
```ConsoleVm ```
Security Configuration

NSG inbound rules were configured to allow:

- HTTP (Port 80)
IIS Deployment :

The ERP IIS application was migrated and deployed successfully on Azure VM.

Public Access Validation
```http://40.82.137.161/Default.html ```
Result

The ERP application became fully operational from Azure infrastructure.

Add screenshots here


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/iisfromazurepublicvm.png?raw=true)


### Phase 9 — File Share Migration
Azure Storage Deployment

Created:

- Azure Storage Account
- Azure File Share
File Share Access

The Azure File Share was mapped as a network drive.

```net use Z: \\consoleltdstorage.file.core.windows.net\consoleldfile /u:AZURE\consoleltdstorage <storage-key> ```
Migration Result:

The on-premises file share was successfully migrated to Azure Files.

Purpose

This phase enabled centralized cloud-based file storage with simplified accessibility and scalability.

Add screenshots here


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/realtyfilesharestoragezure.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/filesharefromonpeime.png?raw=true)

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/filesshareappearonpc.png?raw=true)


### Phase 9 — Secure Connectivty

- Network Securty Group 
    Allow Https  port 80
- firewall Rule
    Allow on-primes ip server to access azure database      


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/NSGForIISVMWebsite.png?raw=true)


![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/AllowIpOnprimeToFirewalldatabse.png?raw=true)

-------------------------------------------------------------------------------------------------------

## Part 3 — Azure Cloud Infrastructure
Now Azure Services Used :-
- Microsoft Entra ID
- Azure Virtual Machines
- Azure SQL Database
- Azure Storage Account
- Azure Files
- Azure Monitor
- Application Insights
- Network Security Groups
- Virtual Networks





 ### Infrastructure as Code
 

Terraform was used to provision selected Azure infrastructure components including:
```
- Resource Groups
- Virtual Networks
- Network Security Groups
- Azure Virtual Machines
- File share
- Sql Server
- Sql database
- azure monitor

Terraform files are available in:

/terraform

```


### ERP Web Application

A lightweight IIS-based ERP web application was created to simulate a real internal business application.

The application source code is available in:

``` /erp-webapp ```





Monitoring & Observability :-
Centralized monitoring was implemented using Azure monitoring services.

Monitoring Components :-
- Azure Monitor
- VM Insights
- Application Insights
- Metrics Monitoring
- DTU Monitoring
Benefits:-
- Centralized observability
- Application health visibility
- Infrastructure performance tracking
- Resource utilization analysis

![AD DS Screenshot](https://github.com/jkaljokey-hub/consoleLtd-onprem-to-azure-migration/blob/main/assets/monitorInsight.png?raw=true)





Migration Outcome:-

After successful validation:

- On-premises workloads were migrated to Azure
- ERP application became cloud-hosted
- Database services moved to Azure SQL
- File services migrated to Azure Files
- Centralized monitoring was implemented
- Legacy infrastructure dependencies were reduced


## 🎯 Conclusion

This project demonstrates a full enterprise migration from legacy on‑premises infrastructure to a modern, secure, cloud‑based environment using Microsoft Azure and Microsoft Entra ID.

## Author
Abubakar – abubakaralnour43@gmail.com




