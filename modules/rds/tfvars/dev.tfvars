regions = ["us-west-1"]
db_identifier = "dev-postgres"
engine_version = "15.3"
instance_class = "db.t3.micro"
allocated_storage = 20
username = "devuser"
password = "devpassword"
db_name = "devdb"
security_group_id = "sg-xxxxxxxx"
db_subnet_group_name = "dev-subnet-group"
multi_az = false
tags = {
  Environment = "dev"
  Owner       = "dev-team"
}
