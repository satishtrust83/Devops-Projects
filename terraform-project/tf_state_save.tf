/* # TODO: to uncomment after s3 bucket gets created.
 terraform {
	backend "s3" {

	 bucket = "terraform-assignment-bucket"
	 key = "terraform.tfstate"
	 region = "ap-south-1"

	 dynamodb_table = "terraform_up_and_running_locks"
	 encrypt = true

	}
}
*/

resource "aws_s3_bucket" "s3" {
    bucket = "terraform-assignment-bucket"
    versioning {
	      enabled = true
	}

    server_side_encryption_configuration {
	rule {
		apply_server_side_encryption_by_default {
			sse_algorithm = "AES256"
		    }
	    }	
    }

    tags = {
        Name  = "My bucket"
        Environment = "Test"
  }
}

resource "aws_dynamodb_table" "dt" {
    name           = "terraform_up_and_running_locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key       = "LockID"
     attribute {
        name = "LockID"
        type = "S"
  }
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "Test"
  }
}
