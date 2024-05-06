variable "aws_shared_credentials_files" {
    type = string
    default = "/home/<localhost_username>/.aws/credentials"
}
variable "aws_profile" {
    type = string
    default = "default"
}
variable "aws_region" {
    type = string
    default = "us-west-2"
}
variable "env" {
    type = string
    default = "hak5_cloudc2"
}
##################################################
variable "remote_user" {
    type = string
    default = "ubuntu"
}
##################################################
variable "ssh_directory_path" {
    type = string 
    default = "/home/<localhost_username>/.ssh/aws_lightsail_hak5_cloudc2"
}
variable "private_key_filename" {
    type = string
    default = "/home/<localhost_username>/.ssh/aws_lightsail_hak5_cloudc2/private_key_openssh"
}
variable "extract_hak5_cloudc2_setup_token_sh" {
    type = string
    default = "/include/scripts/extract_hak5_cloudc2_setup_token.sh"   
}
##################################################
variable "aws_lightsail_static_ip_name" {
    type = string
    default = "static_ip_name"
}
##############################
variable "aws_lightsail_instance" {
  type = object({
    name              = string
    availability_zone = string
    blueprint_id      = string
    bundle_id         = string
    ip_address_type   = string
    user_data         = string

    add_on = object({
      autosnapshot = object({
        type          = string
        snapshot_time = string
        status        = string
      })
    })
  })

  default = {
    name              = "instance_name"
    availability_zone = "us-west-2a"
    blueprint_id      = "ubuntu_22_04"
    bundle_id         = "nano_3_0"
    ip_address_type   = "dualstack"
    user_data         = "/include/scripts/install_hak5_cloudc2.sh"

    add_on = {
      autosnapshot = ({
        type          = "AutoSnapshot"
        snapshot_time = "06:00"
        status        = "Disabled"   
      })
    }
  }
}
##################################################
variable "aws_lightsail_instance_key_pair_name" {
    type = string
    default = "key_pair_name"
}
##################################################
variable "aws_lightsail_instance_public_ports" {
  type = object({
    port_22 = object({
      cidrs      = list(string)
      ipv6_cidrs = list(string)
    })
    port_80 = object({
      cidrs      = list(string)
      ipv6_cidrs = list(string)
    })
    port_2022 = object({
      cidrs      = list(string)
      ipv6_cidrs = list(string)
    })
    port_8080 = object({
      cidrs      = list(string)
      ipv6_cidrs = list(string)
    })
    port_443 = object({
      cidrs      = list(string)
      ipv6_cidrs = list(string)
    })
  })

  default = {
    #  Set this to the essential IPv4 ranges your organization trusts, e.g., ["10.0.0.0/8", "192.168.0.0/16"]
    #  Set this to the essential IPv6 ranges your organization trusts, e.g., ["2001:db8::/32"]
    port_22 = {
      cidrs      = ["0.0.0.0/0"]   # SSH access:
      ipv6_cidrs = ["::/0"]        # SSH access:
    }
    port_2022 = {
      cidrs      = ["0.0.0.0/0"]   # Allow Hak5 devices to connect to Cloud C2 over SSH (Do not change this unless your devices have been configured to use another port)
      ipv6_cidrs = ["::/0"]        # Allow Hak5 devices to connect to Cloud C2 over SSH (Do not change this unless your devices have been configured to use another port)
    }
    port_80 = {
      cidrs      = ["0.0.0.0/0"]   # http://<static_public>
      ipv6_cidrs = ["::/0"]        # http://<static_public>
    }
    port_8080 = {
      cidrs      = ["0.0.0.0/0"]   # http://<static_public>:8080 Web Appplication
      ipv6_cidrs = ["::/0"]        # http://<static_public>:8080 Web Application
    }
    port_443 = {
      cidrs      = ["0.0.0.0/0"]   # https://<your_domain>.tld
      ipv6_cidrs = ["::/0"]        # https://<your_domain>.tld
    }
  }
}
##################################################