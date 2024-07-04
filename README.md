# Terraform_AzureInfra

We can build, change, and destroy Azure infrastructure using Terraform.<br>

Below are the ways to create Azure Infra using Terraform:

1) Azure DevOps Pipelines
2) Azure CLI
3) VS Code

   ## 1. Azure DevOps Pipelines

Pre-requisites:<br>
  -You need to download and install Terraform extenstion from ADO market place in you ADO organization. <br>
  -You need azure storage account container blob to store .tfstate file to maintain the state of your infra.
  -Store configuration tf files in azure repo branch and provide the path of that folder to respective init / plan / apply / destroy ADO terraform tasks.

Here is the view of ADO pipeline,

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/61c5456a-5900-49fc-ad77-7f6d587a125d)

Deployment is succeeded!!

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/2707791d-2e69-4cea-97d9-af5f70dac565)

Let's check if AZURE VM is created or not...
Here, we go :)

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/518ca65b-8be7-4076-a3e9-3987fef56402)

Let's check if our terraform state file has created in provided storage account container blob,
Here, we go :)

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/26de0331-718c-4bbe-b33f-ae4160fcff43)

