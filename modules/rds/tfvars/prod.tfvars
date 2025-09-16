regions = ["us-east-1", "us-west-1"]
db_identifier = "prod-postgres"
engine_version = "15.3"
instance_class = "db.t3.medium"
allocated_storage = 100
username = "produser"
password = "prodpassword"
db_name = "proddb"
security_group_id = "sg-xxxxxxxx"
db_subnet_group_name = "prod-subnet-group"
multi_az = true
tags = {
  Environment = "prod"
  Owner       = "prod-team"
}
