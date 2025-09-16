regions = ["us-west-2"]
db_identifier = "qa-postgres"
engine_version = "15.3"
instance_class = "db.t3.micro"
allocated_storage = 20
username = "qauser"
password = "qapassword"
db_name = "qadb"
security_group_id = "sg-xxxxxxxx"
db_subnet_group_name = "qa-subnet-group"
multi_az = false
tags = {
  Environment = "qa"
  Owner       = "qa-team"
}
