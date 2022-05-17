aws s3 mb s3://yulei-static-web

aws s3 cp ../StaticWeb/index.html s3://yulei-static-web/index.html

aws s3 cp ../StaticWeb/error.html s3://yulei-static-web/error.html

aws s3api put-bucket-policy --bucket yulei-static-web --policy file://s3BucketPolicy.json

aws s3 website s3://yulei-static-web/ --index-document index.html --error-document error.html