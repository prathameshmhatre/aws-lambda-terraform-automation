
variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda handler"
  type        = string
}

variable "runtime" {
  description = "Runtime for Lambda"
  type        = string
}

variable "environment" {
  description = "Environment to deploy to"
  type        = string
  
}

variable "lambda_zip_file" {
  description = "The name of the zip file containing the Lambda function code."
  type        = string
  default     = "lambda.zip"
}

variable "lambda_timeout" {
  description = "The amount of time in seconds that Lambda has to run your code."
  type        = number
  default     = 10
  
}