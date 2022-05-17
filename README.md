# Yulei-static-web
A sample static web

## Deployment Instruction

### Prerequisite
1. AWS CLI V2 installed
2. AWS Account created
3. Create a user in AWS IAM console with that enable all s3 action for S3 static web deployment in AWS, save the user access key id and access secret key.
4. Configure AWS CLI with the new create user

### Deployment Process
1. Check if http://yulei-static-web.s3-website-ap-southeast-2.amazonaws.com/
exist. Ideally it should not exist.

2. 
a) For Linux/MacOX:
    use terminal/command line to run script Yulei-static-web/CloudFormation/s3-static-web-deploy.sh
    
b) For Windows:
    use terminal/command line to run script Yulei-static-web/CloudFormation/s3-static-web-deploy.bat
    
3. Check again the website link http://yulei-static-web.s3-website-ap-southeast-2.amazonaws.com/
is successfully created and accessible.

### Destroy process
Once decide to destroy, run the script:
a) For Linux/MacOX:
    use terminal/command line to run Yulei-static-web/CloudFormation/s3-static-web-destroy.sh
b) For Windows:
    use terminal/command line to run Yulei-static-web/CloudFormation/s3-static-web-destroy.bat
    
URL http://yulei-static-web.s3-website-ap-southeast-2.amazonaws.com/ should not be accessible now, and no bucket yulei-static-web exist.

## Documentation
### Area of Improvement
1. Remove the hardcode of the bucket name of "yulei-static-web” in the deploy script, the destroy script and the policy JSON file.

2. We want to use a customised domain name for the website. We can get it done by placing the S3 access behind CloudFront, so the URL is now shown as a different domain without "s3". 
The AWS CLI should move away from using User but IAM Role for security best practice.

3. Use s3 sync rather than use s3 cp to sync the whole folder of html content during deployment, this improve the scalabilities of work in future.

4. We can add a few images in a different bucket to improve the website contents and enable the CORS on the resource bucket for the website hosting bucket to access images.

### Alternative Solution
1. Create CloudFormation Stack with AWS CDK (Cloud Developer Toolkit) to deploy it as infrastructure as code, makes it easier to create and destroy stack from AWS CloudFormation in one place to save time. It automates the resource creation process such as AWS CloudFront, AWS API Gateway and AWS WAF to make this website production-ready. Due to time constraint, I did not do it because this will require installation of CDK and more time to code the infrastructure, but a good thing to do if time is allowed to ensure consistent deployment every time, and it is easier to destroy and take off the stack and website if not required.

2. The S3 bucket creation and content upload can be done with python BOTO3, but this will require more setup (installing Python and BOTO3 package), therefore I do not go with this option due to time constraint. With the AWS CLI command, it can run on all machines with minimal work to set up for POC.

3. We can also host the website with AWS EC2 instead of S3, but this is not the best option due to maintenance overhead and is less cost-efficient for a simple static website. S3 is a better and faster option if only deploying a static website.

### Additional Works
1. Create the cloud resource as CloudFormation Stack as mentioned in Alternative Solution to create infrastructure-as-code.

2. Create a Docker file and add it to the git repository. Run the deployment process within a docker container with required packages and layers included. So it reduces the workload to install packages for a new team member and improves the efficiency of deployment. Add the following packages as layers in docker: Python, BOTO3, AWS CDK, AWS CLI .e.t.c

For this static website to be production-ready, the cloud stack should follow the cloud well-architecture best practise with operation-excellent, fault-tolerant, and secure. 

3. Set up a CloudFront to cache the content to reduce the latency to access the website, help the global launch faster, and prevent DDOS attacks by whitelists\blacklists the IPs required in CloudFront and S3 bucket policy. Also, it can ensure that visitors can only access the website content through CloudFront rather than S3.
Create a CloudFront Origin Access Identity (OAI), and add that to the CloudFront Distribution.
Configure the S3 bucket policy and ACLs to allow only the OAI from the AWS CloudFront to access the bucket and content.

4. Add Fault Tolerant: Set up replication in S3 buckets to replicate and back up the content to another bucket in a different region. It can back up in case the home region is down.

5. Ensure that no one accidentally deletes the website in s3, we want to ensure that there is deletion protection enabled on statics web-hosting S3 during the production deployment.

6. Ensure that we have HTTPS with the SSL/TLS certification for the website security. It can be done by adding the certificate while creating the CloudFront.
