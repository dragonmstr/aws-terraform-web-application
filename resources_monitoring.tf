# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_account
# As there is no API method for deleting account settings or resetting it to defaults,
# destroying this resource will not do anything.
resource "aws_api_gateway_account" "this_region" {
  count = var.api_gateway_log_role ? 1 : 0

  cloudwatch_role_arn = module.api_gateway_log_cloudwatch_role[0].role_arn
}

resource "aws_cloudwatch_log_group" "crud_api" {
  count = var.log_apis ? 1 : 0

  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.crud.id}/${local.crud_stage_name}"
  retention_in_days = 60
}

resource "aws_cloudwatch_log_group" "textract_api" {
  count = var.log_apis ? 1 : 0

  name              = "API-Gateway-V2-Execution-Logs_${aws_apigatewayv2_api.textract.id}"
  retention_in_days = 60
}
