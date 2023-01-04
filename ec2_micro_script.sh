aws ec2 run-instances \
    --image-id ami-0b5eea76982371e91 \
    --count 1 \
    --instance-type t2.micro \
    --key-name chasey_key_pair \
    --security-group-ids sg-0dc5b3cb8074dfc24 \
    --subnet-id subnet-07e2339f0543fa3d4 \
    --associate-public-ip-address \
    --block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":30,\"DeleteOnTermination\":false}}]" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux_Machine}]' 'ResourceType=volume,Tags=[{Key=Name,Value=demo-server-disk}]' \
    --user-data file://script.sh

aws ec2 describe-instances \
--filters \
"Name=instance-state-name,Values=running" \
"Name=tag:Name,Values=Linux_Machine" \
--query 'Reservations[*].Instances[*].[PublicIpAddress]'
--output text


