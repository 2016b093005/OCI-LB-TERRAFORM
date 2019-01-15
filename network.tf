
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

resource "oci_core_internet_gateway" "LbIgw" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "LbIgw"
    vcn_id = "${oci_core_virtual_network.LbVcn.id}"
}

resource "oci_core_route_table" "LbRouteTable" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_virtual_network.LbVcn.id}"
    display_name = "LbRouteTable"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${oci_core_internet_gateway.LbIgw.id}"
    }
}

resource "oci_core_security_list" "LbSecurityList" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "LbSecurityList"
    vcn_id = "${oci_core_virtual_network.LbVcn.id}"

    egress_security_rules = [{
        protocol = "all"
        destination = "0.0.0.0/0"
    }]

    ingress_security_rules = [
    {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            "min" = 22
            "max" = 22
        }
    },
    {
        protocol = "1"
        source = "0.0.0.0/0"
        icmp_options {
            "type" = 3
            "code" = 4
        }
    }]
}

resource "oci_core_subnet" "PublicSubnetAD1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block          = "${var.PubSubnetAD1CIDR}"
  display_name        = "PublicSubnetAD1"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.LbVcn.id}"
  route_table_id      = "${oci_core_route_table.LbRouteTable.id}"
  security_list_ids   = ["${oci_core_security_list.LbSecurityList.id}"]
}

resource "oci_core_subnet" "PublicSubnetAD2" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  cidr_block          = "${var.PubSubnetAD2CIDR}"
  display_name        = "PublicSubnetAD2"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.LbVcn.id}"
  route_table_id      = "${oci_core_route_table.LbRouteTable.id}"
  security_list_ids   = ["${oci_core_security_list.LbSecurityList.id}"]
}

resource "oci_core_subnet" "PubSubnetAD3CIDR" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[2],"name")}"
  cidr_block          = "${var.PubSubnetAD3CIDR}"
  display_name        = "PublicSubnetAD3"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.LbVcn.id}"
  route_table_id      = "${oci_core_route_table.LbRouteTable.id}"
  security_list_ids   = ["${oci_core_security_list.LbSecurityList.id}"]
}
