resource "aws_codebuild_project" "codebuild" {
  name           = var.codebuild_project_name
  description    = var.project_description
  service_role = var.code_build_service_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.images
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }


  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }

  source {
    type            = "GITHUB"
    location        = var.github_repository
    buildspec       = var.buildspec_file
    git_clone_depth = var.clone_depth
    report_build_status = true
  }

  source_version = var.branch_name

}

resource "aws_codebuild_webhook" "codebuild_with_filters" {
  count = var.create_webhook_with_filters ? 1 : 0
  project_name = aws_codebuild_project.codebuild.name
  #branch_name = var.branch_name
   build_type   = "BUILD"
  filter_group {
    filter {
      type    = var.type1
      pattern = var.pattern1
    }

    filter {
      type    = var.type2
      pattern = var.pattern2
    }
  }
}
