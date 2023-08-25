import pulumi
import pulumi_aws as aws
from pulumi import export

config = pulumi.Config()
data = config.require_object("data")

vpc = aws.ec2.Vpc(data.get("vpc_name"), 
               cidr_block=data.get("vpc_cidr"),
               tags={
                   "Name": data.get("vpc_name"),
                   "CreatedBy": data.get("CreatedBy")
               })

igw = aws.ec2.InternetGateway(data.get("igw_name"),
                              vpc_id=vpc.id,
                              tags={
                                  "Name": data.get("igw_name"),
                                  "CreatedBy": data.get("CreatedBy")
                              })

privatesubnet = aws.ec2.Subnet(data.get("prv_subnet_name"),
                               vpc_id=vpc.id,
                               cidr_block=data.get("prv_cidr"),
                               map_public_ip_on_launch=False,
                               tags={
                                   "Name": data.get("prv_subnet_name"),
                                   "CreatedBy": data.get("CreatedBy") 
                                   })

publicsubnet = aws.ec2.Subnet(data.get("pub_subnet_name"),
                              vpc_id=vpc.id,
                              cidr_block=data.get("pub_cidr"),
                              map_public_ip_on_launch=True,
                              tags={
                                  "Name": data.get("pub_subnet_name"),
                                  "CreatedBy": data.get("CreatedBy")
                                  })

pubroutetable = aws.ec2.RouteTable(data.get("pubrttable_name"),
                                   vpc_id=vpc.id,
                                   routes=[
                                       aws.ec2.RouteTableRouteArgs(
                                           cidr_block="0.0.0.0/0",
                                           gateway_id=igw.id,
                                           )],
                                           tags={
                                               "Name": data.get("pubrttable_name"),
                                               "CreatedBy": data.get("CreatedBy")
                                               })

pub_route_association = aws.ec2.RouteTableAssociation(data.get("pubrtasst_name"),
                                                      route_table_id=pubroutetable.id,
                                                      subnet_id=publicsubnet.id
)

sg = aws.ec2.SecurityGroup( data.get("sec_grp_name"),
                           description="Allow HTTP traffic to EC2 instance",
                           ingress=[{
                               "protocol": "tcp",
                               "from_port": 80,
                               "to_port": 80,
                               "cidr_blocks": ["0.0.0.0/0"],
                               },
                               {
                                   "protocol": "tcp",
                                   "from_port": 22,
                                   "to_port": 22,
                                   "cidr_blocks": ["0.0.0.0/0"],
                               }
                               ],
                               egress=[{
                                   "protocol": "-1",
                                   "from_port": 0,
                                   "to_port": 0,
                                   "cidr_blocks": ["0.0.0.0/0"],
                                   }],
                                   vpc_id=vpc.id)

ami = aws.ec2.get_ami(most_recent=True,
                      owners=["099720109477"],
                      filters=[
                          aws.ec2.GetAmiFilterArgs(
                              name="name",
                              values=["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"],
                          ),
                          aws.ec2.GetAmiFilterArgs(
                              name="virtualization-type",
                              values=["hvm"],
                          ),
                      ])

keypair = aws.ec2.KeyPair("keypair", public_key=data.get("public_key"))

user_data = """
#!/bin/bash
sudo apt-get update -y 
sudo apt-get install nginx -y
sudo systemctl start nginx
"""

ec2_instance = aws.ec2.Instance(data.get("ec2_instance_name"),
                                instance_type=data.get("ec2_instance_type"),
                                vpc_security_group_ids=[sg.id],
                                ami=ami.id,
                                key_name=keypair.key_name,
                                subnet_id=publicsubnet.id,
                                user_data=user_data,
                                tags={
                                    "Name": data.get("ec2_instance_name"),
                                    "CreatedBy": data.get("CreatedBy")
                                }
                                )

pulumi.export("EC2 Public IP",ec2_instance.public_ip)
