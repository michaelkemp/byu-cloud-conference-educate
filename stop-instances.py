import sys
import boto3
from botocore.exceptions import ClientError

region = "us-east-1"
session = boto3.Session()

ec2 = session.client('ec2',region_name=region)
response = ec2.describe_instances()
for r in response['Reservations']:
    for i in r['Instances']:
        if i['State']['Name'] == "running":
            try:
                stop = ec2.stop_instances(InstanceIds=[i['InstanceId']], DryRun=False)
                print(stop)
            except:
                print("oops")

rds = session.client('rds',region_name=region)
response = rds.describe_db_instances()
for r in response['DBInstances']:
    if r["DBInstanceStatus"] == "available":
        try:
            stop = rds.stop_db_instance(DBInstanceIdentifier=r["DBInstanceIdentifier"])
            print(stop)
        except:
            print("oops")

