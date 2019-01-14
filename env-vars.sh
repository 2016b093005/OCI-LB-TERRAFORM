### Provider credentials - Mandatory
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaavswyapsd3prd2ylq34hvilyxfzqy7icvr2v6uq2zvhldq33f7cyq"
export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaawznrufhtsxd45gat5hihfpm5qvftyivuzwi3rbtmq3yuymf3ngga"
export TF_VAR_fingerprint="d3:14:07:41:4f:41:25:6a:33:d6:22:ed:92:c8:49:9f"
export TF_VAR_private_key_path="/root/.oci/oci_api_key.pem"
export TF_VAR_private_key_password=""

### Region - Mandatory
export TF_VAR_region="us-ashburn-1"

### Compartment - Mandatory
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaa4kkb7nptzln7n5ewdh3b3d6aclkktjojnfoced2wykcmozif37sq"

### Instance credentials - Mandatory
export TF_VAR_ssh_public_key=$(cat /root/.ssh/id_rsa.pub)
export TF_VAR_ssh_private_key=$(cat /root/.ssh/id_rsa)

### AD
export TF_VAR_AD1=""
export TF_VAR_AD2=""

### VCN configuration
export TF_VAR_vcn_cidr="10.0.0.0/16"
export TF_VAR_mgmt1_subnet_cidr=""
export TF_VAR_mgmt2_subnet_cidr=""
export TF_VAR_lb1_subnet_cidr=""
export TF_VAR_lb2_subnet_cidr=""
export TF_VAR_be1_subnet_cidr=""
export TF_VAR_be2_subnet_cidr=""

### Shape of the private loadbalancer
export TF_VAR_lb_shape=""

### DNS name and domain for the HA app
export TF_VAR_ha_app_name=""
export TF_VAR_ha_app_domain=""

### Port and protocol for the HA app
export TF_VAR_ha_app_port=""
export TF_VAR_ha_app_protocol=""

### Port and protocol for the backend instances
export TF_VAR_backend_port=""
export TF_VAR_backend_protocol=""

### Instance configuration
export TF_VAR_InstanceShape=""
export TF_VAR_InstanceImageOCID=""

### On-prem configuration
export TF_VAR_onprem_cidr=""
export TF_VAR_onprem_domain=""
export TF_VAR_onprem_dns_server1=""
export TF_VAR_onprem_dns_server2=""
