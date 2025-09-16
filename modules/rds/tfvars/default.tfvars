regions = ["us-west-1"]
db_identifier = "default-postgres"
engine_version = "15.3"
instance_class = "db.t3.micro"
allocated_storage = 20
username = "defaultuser"
password = "defaultpassword"
db_name = "defaultdb"
security_group_id = "sg-xxxxxxxx"
db_subnet_group_name = "default-subnet-group"
multi_az = false
tags = {
  Environment = "default"
  Owner       = "default-team"
}
