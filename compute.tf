resource "oci_core_instance" "PublicWebServer" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "PublicWebServer"
  image               = "ocid1.image.oc1.iad.aaaaaaaawiur3bi46qsb6egmfqnfhsn66kj74bnvnfxrr7o72wiyuhzy2fba"
  shape               = "VM.Standard2.1"
  subnet_id           = "${oci_core_subnet.PublicSubnetAD2.id}"

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    # user_data           = "${base64encode(file(var.BastionBootStrap))}"
  }
}
