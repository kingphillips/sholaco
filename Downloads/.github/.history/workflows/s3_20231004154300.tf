# s3 bucket for terraform backend
resource "aws_s3_bucket" "backend" {
  bucket = "bootcamp32-${var.env}-${random_integer.backend.result}"
  tags = {
    Name        = "My backend"
    Environment = "Dev"
  }
}

#kms key for bucket encryption
resource "aws_kms_key" "my_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.backend.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.my_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

variable "env" {
  type    = string
  default = "Dev"
}

#
resource "random_integer" "backend" {
  min = 1
  max = 100
  keepers = {
    Environment = var.env
  }
}
