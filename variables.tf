variable "project_id" {
  type    = string
  default = "unified-chess-331509"
}


variable "region" {
  type    = string
  default = "us-central1"
}

variable "main_zone" {
  type    = string
  default = "us-central1-b"
}

#============================= SUBNETWORKS VARIABLES ===================================

#--------------------------------- PRESENTATION ----------------------------------------
variable "presentation_ip_range" {
  description = "IP range of Presentation subnetwork"
  type        = string
  default     = "10.1.0.0/16"
}

#--------------------------------- APPLICATION -----------------------------------------
variable "application_ip_range" {
  description = "IP range of Application subnetwork"
  type        = string
  default     = "10.2.0.0/16"
}
#----------------------------------- DATABASE ------------------------------------------
variable "database_ip_range" {
  description = "IP range of Database subnetwork"
  type        = string
  default     = "10.3.0.0/16"
}


#================================== ROUTES VARIABLE ====================================
variable "igw_destination" {
  description = "The destination range of outgoing packets that this route applies to. Only IPv4 is supported"
  type        = string
  default     = "0.0.0.0/0"
}




#============================ FIREWALL RULES VARIABLES =================================

#------------------------------ PRESENTATION FIREWALL ----------------------------------
variable "presentation_firewall_ranges" {
  description = "If direction <INGRESS> are specified, the firewall will apply only to traffic that has source IP address in these ranges. If direction <EGRESS>  are specified, the firewall will apply only to traffic that has destination IP address in these ranges."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

#------------------------------ APPLICATION FIREWALL -----------------------------------
variable "application_firewall_ranges" {
  description = "If direction <INGRESS> are specified, the firewall will apply only to traffic that has source IP address in these ranges. If direction <EGRESS>  are specified, the firewall will apply only to traffic that has destination IP address in these ranges."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}


#------------------------------ DATABASE FIREWALL --------------------------------------
variable "database_firewall_ranges" {
  description = "If direction <INGRESS> are specified, the firewall will apply only to traffic that has source IP address in these ranges. If direction <EGRESS>  are specified, the firewall will apply only to traffic that has destination IP address in these ranges."
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
