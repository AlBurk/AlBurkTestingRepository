
# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}


module test_example {
  source                 = "../modules/codebuild"
  codebuild_project_name = "test-example"
  project_description    = "Deploy test-example"
  github_repository      = "https://github.com/AlBurk/AlBurkTestingRepository.git"
  branch_name            = "main"
  buildspec_file         = "buildspec/buildspec.yaml"
  create_webhook_with_filters         = false
}
