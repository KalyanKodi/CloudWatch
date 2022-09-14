# create folder 
mkdir $env:USERPROFILE/Desktop/

# to download 
Invoke-WebRequest -Uri https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi -OutFile $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi


# To install
msiexec /i $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi

# To test the installation 
Test-Path -Path $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi

# remove old config file 
rm  'C:\Program Files\Amazon\AmazonCloudWatchAgent\config.json'

# installing cloud watch configuraton file
Invoke-WebRequest -Uri https://raw.githubusercontent.com/KalyanKodi/CloudWatch/main/config.json -OutFile  'C:\Program Files\Amazon\AmazonCloudWatchAgent\config.json'


# restart cloud watch agent
& $env:ProgramFiles\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1 -a fetch-config -m ec2 -c file:$env:ProgramFiles\Amazon\AmazonCloudWatchAgent\config.json -s
