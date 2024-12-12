
lambda_name          = "dev-lambda-function"
handler              = "index.handler"
runtime              = "nodejs14.x"
lambda_role_arn      = "arn:aws:iam::123456789012:role/dev-lambda-role"
environment_variables = {
  ENVIRONMENT = "dev"
}

rest_api_name        = "dev-api-gateway"
