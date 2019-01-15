# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Gets a list of vNIC attachments on the bastion host
data "oci_core_vnic_attachments" "MyServerVnics" {
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  instance_id         = "${oci_core_instance.PublicWebServer.id}"
}

# Gets the OCID of the first (default) vNIC on the bastion host
data "oci_core_vnic" "MyServerVnic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.MyServerVnics.vnic_attachments[0],"vnic_id")}"
}
