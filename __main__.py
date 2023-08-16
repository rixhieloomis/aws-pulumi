"""An AWS Python Pulumi program"""

import pulumi
import pulumi_aws as aws
from pulumi import export

config = pulumi.Config()
data = config.require_object("data")

virtualprivatecloud = aws.ec2.Vpc(data.get("vpc_name"), 
                                  cidr_block=data.get("vpc_cidr"), 
                                  tags={
                                      "Name": "pulumi-vpc",
                                      "Created-By": "Binaya",
                                      "sdk": "Python"
                                  })
 
privatesubnet = aws.ec2.Subnet(data.get("prv_subnet_name"),
                               vpc_id=virtualprivatecloud.id,
                               cidr_block=data.get("prv_cidr"),
                               map_public_ip_on_launch=False,
                               tags={
                                   "Name": data.get("prv_subnet_name")
                               })
