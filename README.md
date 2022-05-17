# Yulei-static-web
A sample static web

Deployment Instruction:

Prerequisite:
1. AWS CLI V2 installed
2. AWS Account created
3. Create a user in AWS IAM console with that enable all s3 action for S3 static web deployment in AWS, save the user access key id and access secret key.
4. Configure AWS CLI with the new create user

Deployment Process:

1. Check if http://yulei-static-web.s3-website-ap-southeast-2.amazonaws.com/
exist. Ideally it should not exist.

2. 
a) For Linux/MacOX:
    use terminal/command line to run script Yulei-static-web/CloudFormation/s3-static-web-deploy.sh
    
b) For Windows:
    use terminal/command line to run script Yulei-static-web/CloudFormation/s3-static-web-deploy.bat
    
3. Check again the website link http://yulei-static-web.s3-website-ap-southeast-2.amazonaws.com/
is successfully created and accessible.

Destroy process:
Once decide to destroy, run the script:
a) For Linux/MacOX:
    use terminal/command line to run Yulei-static-web/CloudFormation/s3-static-web-destroy.sh
b) For Windows:
    use terminal/command line to run Yulei-static-web/CloudFormation/s3-static-web-destroy.bat
    
URL http://yulei-static-web.s3-website-ap-southeast-2.amazonaws.com/ should not be accessible now, and no bucket yulei-static-web exist.
