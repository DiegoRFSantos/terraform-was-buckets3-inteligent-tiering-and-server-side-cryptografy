resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "bucket_it_configuration" {
  bucket = aws_s3_bucket.bucket.bucket
  name = "ITConfiguration"

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days = 720
  }

  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days = 365
  }
}

# -------- Abaixo, caso queira aplica critpografia em repouso no bucket

# KMS 

resource "aws_kms_key" "kms_buket_encryption" {
  description = "Chave de encrypt para o bucket"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption_config" {

bucket = aws_s3_bucket.bucket.bucket

rule {
  apply_server_side_encryption_by_default {
    kms_master_key_id = aws_kms_key.kms_buket_encryption.arn
    sse_algorithm = "aws:kms"
  }

  bucket_key_enabled = true
  blocked_encryption_types = [ "SSE-C" ]
}


}