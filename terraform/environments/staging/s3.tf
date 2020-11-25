resource "aws_s3_bucket" "b" {
  bucket = "${local.project_name-environment}-bucket"

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}
