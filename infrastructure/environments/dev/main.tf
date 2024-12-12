
module "lambda" {
  source = "../../modules/lambda"

  lambda_name          = var.lambda_name
  handler              = var.handler
  runtime              = var.runtime
  lambda_role_arn      = var.lambda_role_arn
  lambda_package_path  = "../../lambda_function/lambda.zip"
  environment_variables = var.environment_variables
}

module "apigateway" {
  source       = "../../modules/apigateway"
  rest_api_name = var.rest_api_name
  lambda_arn    = module.lambda.lambda_arn
}
