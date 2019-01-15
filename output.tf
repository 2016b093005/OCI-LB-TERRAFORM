output "MyServerPublicIp" {
  value = ["${data.oci_core_vnic.MyServerVnic.public_ip_address}"]
}
