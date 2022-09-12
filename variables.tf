variable "ACCESS_KEY" {
  description = "ACCESS KEY"
  default     = ""
}
variable "SECRET_KEY" {
  description = "SECRET KEY"
  default     = ""
}

variable "venci-cidr" {
  type    = list(any)
  default = ["192.168.0.0/24", "192.168.1.0/24"]
} 