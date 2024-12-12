# Define the API Gateway
resource "aws_apigatewayv2_api" "api" {
  name          = var.rest_api_name
  protocol_type = "HTTP"
}

# Define the Lambda integration with API Gateway
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"
  integration_uri  = var.lambda_arn
}

# Define the GET route for the API Gateway
resource "aws_apigatewayv2_route" "route" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /{proxy+}" # Defines a GET request
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# Optional: Add a default stage for deployment
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "default" # Default stage
  auto_deploy = true
}

