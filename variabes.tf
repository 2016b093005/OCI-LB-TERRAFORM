variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "private_key_password" {}
variable "compartment_ocid" {}
variable "region" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

# Choose an Availability Domain
variable "AD1" {
    default = "1"
}

variable "AD2" {
    default = "2"
}

variable "InstanceShape" {
    default = "VM.Standard2.1"
}

variable "InstanceImageOCID" {
  type = "map"
  default = {
    // Oracle-provided image "Oracle-Linux-7.4-2017.12.18-0"
    // See https://docs.us-phoenix-1.oraclecloud.com/Content/Resources/Assets/OracleProvidedImageOCIDs.pdf
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaasc56hnpnx7swoyd2fw5gyvbn3kcdmqc2guiiuvnztl2erth62xnq"
    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaayvmxa5eshwxn6psn2bpkuemhpo5hplhibhaw7gxeilnjdqhgdzwa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaayxmzu6n5hsntq4wlffpb4h6qh6z3uskpbm5v3v4egqlqvwicfbyq"
  }
}

variable "vcn_cidr" {
    default = "10.0.0.0/16"
}

variable "lb1_subnet_cidr" {
    default = "10.0.0.0/24"
}
