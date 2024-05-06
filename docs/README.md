# **Instructions**

1. **Clone the Repository**
```
git clone git@github.com:4ce-0f-he4rts/aws_lightsail_hak5_cloudc2.git
```
2. **Modify Entries in your "1-variables.tf"**
```
variable "aws_shared_credentials_files" {
    type = string
    default = "/home/<localhost_username>/.aws/credentials"
}
```
```
variable "ssh_directory_path" {
    type = string 
    default = "/home/<localhost_username>/.ssh/aws_lightsail_hak5_cloudc2"
}
variable "private_key_filename" {
    type = string
    default = "/home/<localhost_username>/.ssh/aws_lightsail_hak5_cloudc2/private_key_openssh"
}
```
3. **Initialize Terraform and Review the Resource Plan**
```
cd ~/aws_lightsail_hak5_cloudc2 && terraform init -reconfigure && terraform plan
```
4. **Build the AWS Infrastructure (Resource Plan)**
```
terraform apply -auto-approve
``` 
5. **Review Generated Files, Directories, and CloudC2 Setup Token**
```
tree ~/.ssh ~/aws_lightsail_hak5_cloudc2 --dirsfirst && cat hak5_cloudc2_setup_token.txt
```
```
ls -la ~/.ssh ~/aws_lightsail_hak5_cloudc2 && cat hak5_cloudc2_setup_token.txt
```
6. **Destroy AWS Infrastructure and Associated Files and Directories**
```
terraform destroy -auto-approve && cd ~ && rm -rf ~/aws_lightsail_hak5_cloudc2 ~/.ssh/aws_lightsail_hak5_cloudc2 ~/.ssh/known_hosts ~/.ssh/known_hosts.old
```
7. **Confirm Resource Destruction**
```
ls -la ~
ls -la ~/.ssh
ls -la ~/.ssh/aws_lightsail_hak5_cloudc2
```
8. **Troubleshoot Ansible**
```
cat inventory.yaml
```
```
ansible-playbook playbook.yaml --syntax-check -vvv
```
```
ansible-inventory -i inventory.yaml --graph --vars --list -vvv
```

