variable "db_username" {
  description = "Username for the db"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "Password for the db user"
  type = string
  sensitive = true
}