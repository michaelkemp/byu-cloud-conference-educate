import sys
import boto3

region = "us-east-1"
session = boto3.Session()

try:
    # on/ON
    action = sys.argv[1].upper()
except:
    action = "OFF"

if action == "ON":
    ec2 = session.client('ec2',region_name=region)
    response = ec2.describe_instances()
    for r in response['Reservations']:
        for i in r['Instances']:
            if i['State']['Name'] == "stopped":
                try:
                    start = ec2.start_instances(InstanceIds=[i['InstanceId']], DryRun=False)
                    print("Starting EC2: " + start["StartingInstances"][0]["InstanceId"])
                except:
                    print("Something went wrong.")

    rds = session.client('rds',region_name=region)
    response = rds.describe_db_instances()
    for r in response['DBInstances']:
        if r["DBInstanceStatus"] == "stopped":
            try:
                start = rds.start_db_instance(DBInstanceIdentifier=r["DBInstanceIdentifier"])
                print("Starting RDS: " + start["DBInstance"]["DBInstanceIdentifier"])
            except:
                print("Something went wrong.")

else:
    ec2 = session.client('ec2',region_name=region)
    response = ec2.describe_instances()
    for r in response['Reservations']:
        for i in r['Instances']:
            if i['State']['Name'] == "running":
                try:
                    stop = ec2.stop_instances(InstanceIds=[i['InstanceId']], DryRun=False)
                    print("Stopping EC2: " + stop["StoppingInstances"][0]["InstanceId"])
                except:
                    print("Something went wrong.")

    rds = session.client('rds',region_name=region)
    response = rds.describe_db_instances()
    for r in response['DBInstances']:
        if r["DBInstanceStatus"] == "available":
            try:
                stop = rds.stop_db_instance(DBInstanceIdentifier=r["DBInstanceIdentifier"])
                print("Stopping RDS: " + stop["DBInstance"]["DBInstanceIdentifier"])
            except:
                print("Something went wrong.")

