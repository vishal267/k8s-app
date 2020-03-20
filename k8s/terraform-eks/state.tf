terraform {
 backend "s3" {
# encrypt = true
 bucket = "one.debian.com-terraform3"
 region = "ap-southeast-2"
 key = "state_file"
 }
}
