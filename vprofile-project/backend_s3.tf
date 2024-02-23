terraform {
  backend "s3" {
    bucket = "terra-state-z"
    key    = "terraform/vprofile"
    region = "us-east-2"
  }
}



# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "my-bucket-name"
#   acl    = "private"  # Specify the ACL (Access Control List) for the bucket
# }

# resource "aws_s3_bucket_object" "my_zip_file" {
#   bucket = aws_s3_bucket.my_bucket.id
#   key    = "path/to/your/source-code.zip"  # Specify the key (i.e., the path) for your zip file
#   source = "path/to/your/local/source-code.zip"  # Specify the local path to your zip file
# }

####for uploading artifacts into s3 using aws cli
# zip -r my_artifacts.zip my_artifacts

# aws s3 cp /path/to/local/file s3://your-bucket-name/path/to/destination/

# aws s3 cp my_artifacts.zip s3://my-bucket/artifacts/


