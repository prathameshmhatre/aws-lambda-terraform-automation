
resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_name
  handler       = var.handler
  runtime       = var.runtime
  role          = var.lambda_role_arn
  filename      = var.lambda_package_path
  source_code_hash = filebase64sha256(var.lambda_package_path)

  environment {
    variables = var.environment_variables
  }
}

output "lambda_arn" {
  value = aws_lambda_function.lambda_function.arn
}
