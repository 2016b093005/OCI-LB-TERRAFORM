
# Create vcn, mgmt and related resources
# MgmtSubnets for DNS VMs
# LBSubnets for LBs
# BackendSubnets for Backend VMs

resource "oci_core_virtual_network" "LbVcn" {
    cidr_block = "${var.vcn_cidr}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "LbVcn"
    dns_label = "lbvcn"
}
