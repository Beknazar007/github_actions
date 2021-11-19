# Automating Terraform with GitHub Actions

[![terraform-automation](https://github.com/r4rohan/terraform-with-cicd/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/r4rohan/terraform-with-cicd/actions/workflows/terraform.yml)

This repo is a part of Medium Article. <br>
Follow Medium blog for steps: [Automating Terraform with GitHub Actions](https://rohankalhans.medium.com/automating-terraform-with-github-actions-5b3aac5abea7)

**Main Points**
* GCS bucket is serving as terraform backend.

* Workflow offers concurrency which means only one workflow can be run at a time; I’ve done this to prevent our terraform state from locking and getting corrupted.

* GitHub secrets are being used to pass GCP Service Account credentials safely on runtime.

* Terraform Plan generates a plan file which is further used by terraform apply. This is done to prevent uninformed changes b/w plan and apply.

* Terraform code must be properly formatted which is considered a good practice else terraform format validation will throw an error and the pipeline would get stopped.

* Manual Approval before applying terraform apply stage.

* Slack Integration for Workflow Alerts.





How can you use GitHub Actions?
Follow to this steps:

* Go to the variables.tf and change project id to your GCP project id

* Go to the secrets under repo and add your GCP Credentials by using the name GOOGLE_CREDENTIALS

* Go to the settings and under Environment add 'apply_to_prod' , select checkbox 
'Required reviewers' and there add the github names of users(who can approve to this project)

* Open the file 'main.tf' and specify GCS Bucket under backend(in order to save tfstate files in bucket)

* Go to the Actions and run workflow mannually by clicking the buttom 'run workflow'

* If the job 'Terraform plan' was run successfully then it will ask you apporval 

* If you want to destroy infrastructure , you should open config.yaml and at the end of the file uncomment 'terraform destory' and run workflow again

Thank you 
I hope everything was clear
If you have any questions regarding to this project you can text me to email:
esenbaevnurmuhamed7@gmail.com

# Adding CircleCI

> I have added Circleci for this project with the same logic as Nurmukhammed does.
1. Adding credentials to the Circleci Context and take it from there.(this was Beki's GCP creds )

        
1. Creating Google storage for **.tfstate** file to safe our spin up info about terraform file

        terraform {
            backend "gcs" {
              bucket = "beki-my-bucket-for-circleci"
              prefix = "terraform/state"
            }  
1. In circleci we have to put context after workflow and than it will work.
        
        workflows: 
          build:
            jobs:
              - build:
                  context: GOOGLE_CREDENTIALS 
              - Attention When you will approve:
                  type: approval 
                  requires:
                    - build
              - build2:
                  context: GOOGLE_CREDENTIALS
                  requires: 
                    - Attention When you will approve.
                    - build

