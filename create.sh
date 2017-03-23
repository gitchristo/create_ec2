git clone https://github.com/gitchristo/create_ec2.git
ansible-playbook create_ec2.yml

aws ec2 describe-instances --filters "Name=tag:Name,Values=ansibleec2" "Name=instance-state-name,Values=running" --query Reservations[].Instances[].[InstanceId] > instanceid.txt
cat instanceid.txt

aws ec2 terminate-instances --instance-ids `cat instanceid.txt` 
