terraform {
  backend "s3" {}
}


provider "aws" {
  region  = var.aws_region
}

module "lambda" {
  source = "./modules/lambda"

  lambda_name     = var.lambda_name
  handler         = var.handler
  runtime         = var.runtime
  lambda_zip_file = var.lambda_zip_file
  environment     = var.environment
}

module "apigateway" {
  source        = "./modules/apigateway"
  rest_api_name = var.rest_api_name
  lambda_arn    = module.lambda.lambda_arn
}