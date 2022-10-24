
terraform {
  backend "s3" {
    bucket         = "my-gourmeal-buc"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region         = "us-east-1"
  }
}

/*resource "aws_s3_bucket" "gourmeal_bucket" {
  bucket = "my-gourmeal-buc"
  acl   = "private"

  tags = {
    Name        = "gourmeal-bucket"
    Environment = "eks"
  }
}
*/

resource "aws_s3_bucket_versioning" "versioning_1" {
  bucket = "my-gourmeal-buc"
  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_dynamodb_table" "tf_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform Lock Table"
  }
}
