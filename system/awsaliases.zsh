alias awse="aws configure set region us-east-1"
alias awsw="aws configure set region us-west-1"

# Get or set the region
awsr() {
	if [[ $# -eq 1 ]]; then
		aws configure set region "$1"
	else
		aws configure get region
	fi;
}

# Describe active EC2 instances
di() {
	aws ec2 describe-instances \
    --filter Name=instance-state-name,Values=running \
    --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value | [0], InstanceId, PrivateIpAddress, InstanceType] | sort_by(@, &[0])'
}

di2(){
  [ -z "$1" ] && DI_PROFILE="" || DI_PROFILE="--profile $1"
  [ -z "$2" ] && DI_REGION="" || DI_REGION="--region $2"
  aws ec2 describe-instances $DI_PROFILE $DI_REGION --filters 'Name=instance-state-name,Values=running' --query 'Reservations[].Instances[].[PublicIpAddress,PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]||[`--`]]' --output text | sed '$!N;s/\n/ /' | column -t -s $'\t'
}

# Start an SSM session
ssm()
{
	if [[ $# -eq 0 ]]; then
		aws ssm
	else
		aws ssm start-session --target "$1"
	fi
}

ssmt() {
	if [[ $# -ne 2 ]]; then
		echo "usage: ssmt <application> <environment>"
	else
		application=$1
		environment=$2
		instance_id=$(aws ec2 describe-instances \
			--filters Name=tag:application,Values=${1} Name=tag:environment,Values=${2} \
			--query 'Reservations[].Instances[].[InstanceId][0]' \
			--output=text)
		if [[ $instance_id == "None" ]]; then
			echo "No instance found matching that application and environment"
			return 1
		fi
  		aws ssm start-session --target ${instance_id}
	fi
}

# Start an SSM session with port forwarding
dbssm()
{
	if [[ $# -ne 2 ]]; then
		echo "usage: dbssm <instanceId> <portNumber>"
	else
		aws ssm start-session --target "$1" --document-name AWS-StartPortForwardingSession --parameter "{\"portNumber\":[\"22\"],\"localPortNumber\":[\"$2\"]}"
	fi
}
