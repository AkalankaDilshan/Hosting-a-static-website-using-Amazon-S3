resource "aws_s3_bucket" "web-hosting-bucket" {
     bucket = "web-hosting-bucket-0875"

     tags = {
          Name = "web-hosting-bucket"
          Environment = "Dev"
     }
}
