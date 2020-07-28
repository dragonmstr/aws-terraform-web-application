# AWS serverless full-stack CRUD web application with Terraform

With such a title, who still needs a project description ;)

## Project purpose

This is a continuation of one of my other projects: [Minimal AWS serverless full-stack CRUD web application](https://github.com/Carlovo/minimal-full-stack-app-aws) (mind the word minimal).
This project aims to deploy a more complete serverless app in AWS.
I chose for Terraform, because I find HCL easier to read than CFN YAML/JSON.
Also, I think Terraform gives you a clearer picture of what is going on beneath the blankets than Amplify.

## Deployment

You need programmatic access to an AWS account and have Terraform on your machine to deploy this application.
I wrote this app using Terraform v0.12.26 with provider.aws v2.65.0 and provider.archive v1.3.0, but later versions usually work in Terraform as well.

If you don't know Terraform or how to use it, please see [their documentation](https://learn.hashicorp.com/terraform).

### Vanilla (CloudFront domain name)

Run the regular `terraform init` and `terraform apply` command and everything should deploy fine.

### Custom domain name

Using this code, you can put a custom domain name from Route53 in front of your CloudFront distribution as well.
Terraform can not register a domain name in Route53, so that is an extra manual prerequisite.
See [the AWS documentation](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar.html) on how to register a domain name with Route53.
You can create all the required connections between CloudFront and Route53 by then following the steps below.

Run the regular `terraform init` as normal.
Run `terraform apply -var='alternate_domain_name=example.com'` and Terraform will try to connect `www.example.com` to your CloudFront distribution. The `alternate_domain_name` has to be an apex domain name.

> Note: most AWS resources deployed with this code typically cost no money under bare usage, but this is not the case for custom domain names and other resources in Route53.

### Terraform output

Terraform will output the website and API endpoint of your app if deployment was successful.
(When using a custom domain name, the CloudFront website endpoint is still available and will be outputted as normal.)

## Contributing

Please raise an issue or a pull request if you encounter bugs or old/deprecated standards.
Other suggestions are also welcome.
