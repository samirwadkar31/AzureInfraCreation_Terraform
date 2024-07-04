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

 ## 1. Azure CLI

 Open cloud shell. Log in or set up the subscription.<br>
 We need to create a separate folder to store our configuration tf file, state file etc<br> 
 cd to your separate folder. Upload tf file and copy/move it to separate folder. <br>

 ![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/31956013-4d9b-4aef-b374-f631d713070f)

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/1e78e4e5-2ffd-4a82-aa76-378968c325ea)

 Now, you can run terraform init / plan / appl / destroy commands in this separate folder.
 
 ![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/75a9a541-0ef1-4c9c-9fdb-db679692a44b)
 ![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/9f5cca46-b6fd-4f14-bc91-be267198edfb)
 
 ![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/ce58752e-26dc-4c3d-8402-ae2894be8edc)
 
 ![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/270ba497-cd27-42d4-9213-84ced4640f59)

 ![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/05008af9-9239-4388-99ad-b0351319ab7c)

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/958e5857-c5df-41d4-891a-e4181711d9b6)

After running the terraform apply command, if we do ls, we can see that the terraform.tfstate file has been generated.

![image](https://github.com/samirwadkar31/AzureInfraCreation_Terraform/assets/74359548/c32ee481-65cd-4792-b98e-ae7863cbac30)



