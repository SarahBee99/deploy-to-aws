variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS CLI profile name"
  type        = string
  default     = "default"
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket name (must be globally unique)"
  type        = string
  default     = "my-second-web-app"
}
