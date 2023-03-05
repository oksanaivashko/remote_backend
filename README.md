# Terraform Backend


### What is Backend?
- Each Terraform configuration can specify a backend, which defines where and how operations are performed, where state snapshots are stored, etc.

Terraform's backends are divided into two main types, according to how they handle state and operations:

- Enhanced backends can both store state and perform operations. There are only two enhanced backends: local and remote.

- Standard backends only store state, and rely on the local backend for performing operations.


Terraform backend is like the repository of instruction to load and run the terraform state when the operation like terraform applies executed. 

First of all, Installing remote backend is not a mandatory feature of the Terraform. But as the modern collaborated teams, we have to have a share location for state file.

### Secure storage
State files need to be stored in a secured and remote location. Remote, so that multiple developers working on the same set of Terraform configuration files can have validation access in their workflow. This avoids having to maintain multiple copies of state files at the same time handling them manually.

Since these state files can potentially secure information and are bound to be accessed multiple times – we need to make sure the storage solution is secure enough. Security here not just means security from the attacker’s perspective but also the integrity of the files. Corrupted state files can cause high infrastructure cost implications.

File storage solutions like AWS S3 offer a secure and reliable way to store and access files within and outside of the internal network.

## Terraform Backend Initialization
- Terraform backend should be configured like any other configuration in the configuration file and when you run the terraform init, Backed will be created. 

For example, we are going to configure the AWS S3 as a Terraform backend

~~~
terraform {
  backend "s3" {
    bucket = "terraform-s3-bucket-name"
    key    = "s3 key path"
    region = "us-west-2"
  }
}
~~~

