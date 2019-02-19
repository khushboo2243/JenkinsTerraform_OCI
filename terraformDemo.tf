variable “tenancy_ocid” {}
variable “user_ocid” {}
variable “fingerprint” {}
variable “private_key_path” {}
variable “compartment_ocid” {}
variable “region” {}

provider “oci” {
 region = “us-ashburn-1"
 }

resource “oci_core_virtual_network” “VCN” {
 cidr_block     = “10.0.0.0/16"
 dns_label      = “VCN”
 compartment_id = “${var.compartment_ocid}”
 display_name   = “VCN”
}

resource “oci_core_internet_gateway” “IGW” {
 compartment_id = “${var.compartment_ocid}”
 display_name   = “IGW”
 enabled        = true
 vcn_id         = “${oci_core_virtual_network.demoVCN.id}”
}
